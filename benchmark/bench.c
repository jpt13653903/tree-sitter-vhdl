/*
 * Benchmark for tree-sitter-vhdl parser performance.
 *
 * Measures two scenarios:
 *   parse     - Parse throughput with a reused parser (measures pure parsing)
 *   lifecycle - Full create+parse+destroy per iteration (measures token tree build cost)
 *
 * Usage: bench <parse|lifecycle> <file> <iterations>
 */

#include <tree_sitter/api.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

extern const TSLanguage *tree_sitter_vhdl(void);

static char *read_file(const char *path, uint32_t *out_len)
{
    FILE *f = fopen(path, "rb");
    if (!f) {
        fprintf(stderr, "Cannot open %s\n", path);
        return NULL;
    }
    fseek(f, 0, SEEK_END);
    long len = ftell(f);
    fseek(f, 0, SEEK_SET);

    char *buf = malloc(len + 1);
    if (!buf) { fclose(f); return NULL; }
    fread(buf, 1, len, f);
    buf[len] = '\0';
    fclose(f);

    *out_len = (uint32_t)len;
    return buf;
}

static double time_diff_ms(struct timespec *start, struct timespec *end)
{
    double s  = (double)(end->tv_sec  - start->tv_sec)  * 1000.0;
    double ns = (double)(end->tv_nsec - start->tv_nsec) / 1e6;
    return s + ns;
}

/* Benchmark: parse the file N times, reusing a single parser instance */
static void bench_parse(const char *source, uint32_t len, int iters)
{
    TSParser *parser = ts_parser_new();
    ts_parser_set_language(parser, tree_sitter_vhdl());

    /* Warm up */
    TSTree *warmup = ts_parser_parse_string(parser, NULL, source, len);
    ts_tree_delete(warmup);

    struct timespec start, end;
    clock_gettime(CLOCK_MONOTONIC, &start);

    for (int i = 0; i < iters; i++) {
        TSTree *tree = ts_parser_parse_string(parser, NULL, source, len);
        ts_tree_delete(tree);
    }

    clock_gettime(CLOCK_MONOTONIC, &end);
    ts_parser_delete(parser);

    double ms = time_diff_ms(&start, &end);
    printf("parse: %d iterations, %.2f ms total, %.4f ms/iter, %.2f parses/sec\n",
           iters, ms, ms / iters, iters / (ms / 1000.0));
    printf("input: %u bytes (%.1f KB)\n", len, len / 1024.0);
    printf("throughput: %.2f MB/s\n", ((double)len * iters) / (ms / 1000.0) / (1024.0 * 1024.0));
}

/* Benchmark: full lifecycle (create parser + parse + destroy) per iteration.
 * This captures the cost of building the token tree on each create. */
static void bench_lifecycle(const char *source, uint32_t len, int iters)
{
    /* Warm up */
    TSParser *p = ts_parser_new();
    ts_parser_set_language(p, tree_sitter_vhdl());
    TSTree *t = ts_parser_parse_string(p, NULL, source, len);
    ts_tree_delete(t);
    ts_parser_delete(p);

    struct timespec start, end;
    clock_gettime(CLOCK_MONOTONIC, &start);

    for (int i = 0; i < iters; i++) {
        TSParser *parser = ts_parser_new();
        ts_parser_set_language(parser, tree_sitter_vhdl());
        TSTree *tree = ts_parser_parse_string(parser, NULL, source, len);
        ts_tree_delete(tree);
        ts_parser_delete(parser);
    }

    clock_gettime(CLOCK_MONOTONIC, &end);

    double ms = time_diff_ms(&start, &end);
    printf("lifecycle: %d iterations, %.2f ms total, %.4f ms/iter, %.2f cycles/sec\n",
           iters, ms, ms / iters, iters / (ms / 1000.0));
    printf("input: %u bytes (%.1f KB)\n", len, len / 1024.0);
}

/* Benchmark: just create + destroy the parser (no parsing).
 * Isolates the token tree construction cost. */
static void bench_create(int iters)
{
    /* Warm up */
    TSParser *p = ts_parser_new();
    ts_parser_set_language(p, tree_sitter_vhdl());
    ts_parser_delete(p);

    struct timespec start, end;
    clock_gettime(CLOCK_MONOTONIC, &start);

    for (int i = 0; i < iters; i++) {
        TSParser *parser = ts_parser_new();
        ts_parser_set_language(parser, tree_sitter_vhdl());
        ts_parser_delete(parser);
    }

    clock_gettime(CLOCK_MONOTONIC, &end);

    double ms = time_diff_ms(&start, &end);
    printf("create: %d iterations, %.2f ms total, %.4f ms/iter, %.2f creates/sec\n",
           iters, ms, ms / iters, iters / (ms / 1000.0));
}

int main(int argc, char **argv)
{
    if (argc < 2) {
        fprintf(stderr, "Usage:\n");
        fprintf(stderr, "  bench parse     <file> [iterations=1000]\n");
        fprintf(stderr, "  bench lifecycle <file> [iterations=100]\n");
        fprintf(stderr, "  bench create    [iterations=1000]\n");
        return 1;
    }

    const char *mode = argv[1];

    if (strcmp(mode, "create") == 0) {
        int iters = (argc > 2) ? atoi(argv[2]) : 1000;
        bench_create(iters);
        return 0;
    }

    if (argc < 3) {
        fprintf(stderr, "Error: file argument required for '%s' mode\n", mode);
        return 1;
    }

    const char *file = argv[2];
    int iters = (argc > 3) ? atoi(argv[3]) : 1000;

    uint32_t len = 0;
    char *source = read_file(file, &len);
    if (!source) return 1;

    if (strcmp(mode, "parse") == 0) {
        bench_parse(source, len, iters);
    } else if (strcmp(mode, "lifecycle") == 0) {
        bench_lifecycle(source, len, iters);
    } else {
        fprintf(stderr, "Unknown mode: %s\n", mode);
        free(source);
        return 1;
    }

    free(source);
    return 0;
}
