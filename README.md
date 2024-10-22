# ubimicro-fluentbit

Fluentbit image as small as possible that build based on Redhat/UBI images.

## Building

Build the image with the following command

```bash
docker build -t ubimicro:fluentbit-3.19 -f Dockerfile .
```

## Filesize

```bash
ubimicro                                        fluentbit-3.19   aa96db27aa19   2 hours ago     80.7MB
fluent/fluent-bit                               latest           7e3fdb64ac8c   3 weeks ago     87.2MB
```

## KNOWN CVES

This is some known cves with `LOW: will_not_fix ` and `MEDIUM:affected` but doesn't have fixed version yet (Scanned with trivy Per 2024-10-22)

```bash
ubimicro:fluentbit-3.19 (redhat 9.4)

Total: 24 (UNKNOWN: 0, LOW: 20, MEDIUM: 4, HIGH: 0, CRITICAL: 0)

┌──────────────┬────────────────┬──────────┬──────────────┬─────────────────────┬───────────────┬─────────────────────────────────────────────────────────────┐
│   Library    │ Vulnerability  │ Severity │    Status    │  Installed Version  │ Fixed Version │                            Title                            │
├──────────────┼────────────────┼──────────┼──────────────┼─────────────────────┼───────────────┼─────────────────────────────────────────────────────────────┤
│ gawk         │ CVE-2023-4156  │ LOW      │ will_not_fix │ 5.1.0-6.el9         │               │ gawk: heap out of bound read in builtin.c                   │
│              │                │          │              │                     │               │ https://avd.aquasec.com/nvd/cve-2023-4156                   │
├──────────────┼────────────────┼──────────┼──────────────┼─────────────────────┼───────────────┼─────────────────────────────────────────────────────────────┤
│ krb5-libs    │ CVE-2024-26462 │ MEDIUM   │ affected     │ 1.21.1-2.el9_4      │               │ krb5: Memory leak at /krb5/src/kdc/ndr.c                    │
│              │                │          │              │                     │               │ https://avd.aquasec.com/nvd/cve-2024-26462                  │
│              ├────────────────┼──────────┤              │                     ├───────────────┼─────────────────────────────────────────────────────────────┤
│              │ CVE-2024-26458 │ LOW      │              │                     │               │ krb5: Memory leak at /krb5/src/lib/rpc/pmap_rmt.c           │
│              │                │          │              │                     │               │ https://avd.aquasec.com/nvd/cve-2024-26458                  │
│              ├────────────────┤          │              │                     ├───────────────┼─────────────────────────────────────────────────────────────┤
│              │ CVE-2024-26461 │          │              │                     │               │ krb5: Memory leak at /krb5/src/lib/gssapi/krb5/k5sealv3.c   │
│              │                │          │              │                     │               │ https://avd.aquasec.com/nvd/cve-2024-26461                  │
├──────────────┼────────────────┤          ├──────────────┼─────────────────────┼───────────────┼─────────────────────────────────────────────────────────────┤
│ libgcc       │ CVE-2022-27943 │          │ will_not_fix │ 11.4.1-3.el9        │               │ binutils: libiberty/rust-demangle.c in GNU GCC 11.2 allows  │
│              │                │          │              │                     │               │ stack exhaustion in demangle_const                          │
│              │                │          │              │                     │               │ https://avd.aquasec.com/nvd/cve-2022-27943                  │
├──────────────┼────────────────┼──────────┼──────────────┼─────────────────────┼───────────────┼─────────────────────────────────────────────────────────────┤
│ libgcrypt    │ CVE-2024-2236  │ MEDIUM   │ affected     │ 1.10.0-10.el9_2     │               │ libgcrypt: vulnerable to Marvin Attack                      │
│              │                │          │              │                     │               │ https://avd.aquasec.com/nvd/cve-2024-2236                   │
├──────────────┼────────────────┤          ├──────────────┼─────────────────────┼───────────────┼─────────────────────────────────────────────────────────────┤
│ libyaml      │ CVE-2024-35325 │          │ will_not_fix │ 0.2.5-7.el9         │               │ libyaml: double-free in yaml_event_delete in                │
│              │                │          │              │                     │               │ /src/libyaml/src/api.c                                      │
│              │                │          │              │                     │               │ https://avd.aquasec.com/nvd/cve-2024-35325                  │
├──────────────┼────────────────┼──────────┤              ├─────────────────────┼───────────────┼─────────────────────────────────────────────────────────────┤
│ libzstd      │ CVE-2022-4899  │ LOW      │              │ 1.5.1-2.el9         │               │ zstd: mysql: buffer overrun in util.c                       │
│              │                │          │              │                     │               │ https://avd.aquasec.com/nvd/cve-2022-4899                   │
├──────────────┼────────────────┤          │              ├─────────────────────┼───────────────┼─────────────────────────────────────────────────────────────┤
│ ncurses-base │ CVE-2022-29458 │          │              │ 6.2-10.20210508.el9 │               │ ncurses: segfaulting OOB read                               │
│              │                │          │              │                     │               │ https://avd.aquasec.com/nvd/cve-2022-29458                  │
│              ├────────────────┤          ├──────────────┤                     ├───────────────┼─────────────────────────────────────────────────────────────┤
│              │ CVE-2023-45918 │          │ affected     │                     │               │ ncurses: NULL pointer dereference in tgetstr in             │
│              │                │          │              │                     │               │ tinfo/lib_termcap.c                                         │
│              │                │          │              │                     │               │ https://avd.aquasec.com/nvd/cve-2023-45918                  │
│              ├────────────────┤          ├──────────────┤                     ├───────────────┼─────────────────────────────────────────────────────────────┤
│              │ CVE-2023-50495 │          │ will_not_fix │                     │               │ ncurses: segmentation fault via _nc_wrap_entry()            │
│              │                │          │              │                     │               │ https://avd.aquasec.com/nvd/cve-2023-50495                  │
├──────────────┼────────────────┤          │              │                     ├───────────────┼─────────────────────────────────────────────────────────────┤
│ ncurses-libs │ CVE-2022-29458 │          │              │                     │               │ ncurses: segfaulting OOB read                               │
│              │                │          │              │                     │               │ https://avd.aquasec.com/nvd/cve-2022-29458                  │
│              ├────────────────┤          ├──────────────┤                     ├───────────────┼─────────────────────────────────────────────────────────────┤
│              │ CVE-2023-45918 │          │ affected     │                     │               │ ncurses: NULL pointer dereference in tgetstr in             │
│              │                │          │              │                     │               │ tinfo/lib_termcap.c                                         │
│              │                │          │              │                     │               │ https://avd.aquasec.com/nvd/cve-2023-45918                  │
│              ├────────────────┤          ├──────────────┤                     ├───────────────┼─────────────────────────────────────────────────────────────┤
│              │ CVE-2023-50495 │          │ will_not_fix │                     │               │ ncurses: segmentation fault via _nc_wrap_entry()            │
│              │                │          │              │                     │               │ https://avd.aquasec.com/nvd/cve-2023-50495                  │
├──────────────┼────────────────┤          ├──────────────┼─────────────────────┼───────────────┼─────────────────────────────────────────────────────────────┤
│ openldap     │ CVE-2023-2953  │          │ affected     │ 2.6.6-3.el9         │               │ openldap: null pointer dereference in ber_memalloc_x        │
│              │                │          │              │                     │               │ function                                                    │
│              │                │          │              │                     │               │ https://avd.aquasec.com/nvd/cve-2023-2953                   │
├──────────────┼────────────────┤          │              ├─────────────────────┼───────────────┼─────────────────────────────────────────────────────────────┤
│ openssl-libs │ CVE-2023-6237  │          │              │ 1:3.0.7-28.el9_4    │               │ openssl: Excessive time spent checking invalid RSA public   │
│              │                │          │              │                     │               │ keys                                                        │
│              │                │          │              │                     │               │ https://avd.aquasec.com/nvd/cve-2023-6237                   │
│              ├────────────────┤          ├──────────────┤                     ├───────────────┼─────────────────────────────────────────────────────────────┤
│              │ CVE-2024-2511  │          │ will_not_fix │                     │               │ openssl: Unbounded memory growth with session handling in   │
│              │                │          │              │                     │               │ TLSv1.3                                                     │
│              │                │          │              │                     │               │ https://avd.aquasec.com/nvd/cve-2024-2511                   │
│              ├────────────────┤          │              │                     ├───────────────┼─────────────────────────────────────────────────────────────┤
│              │ CVE-2024-41996 │          │              │                     │               │ openssl: remote attackers (from the client side) to trigger │
│              │                │          │              │                     │               │ unnecessarily expensive server-side...                      │
│              │                │          │              │                     │               │ https://avd.aquasec.com/nvd/cve-2024-41996                  │
│              ├────────────────┤          ├──────────────┤                     ├───────────────┼─────────────────────────────────────────────────────────────┤
│              │ CVE-2024-4603  │          │ affected     │                     │               │ openssl: Excessive time spent checking DSA keys and         │
│              │                │          │              │                     │               │ parameters                                                  │
│              │                │          │              │                     │               │ https://avd.aquasec.com/nvd/cve-2024-4603                   │
│              ├────────────────┤          ├──────────────┤                     ├───────────────┼─────────────────────────────────────────────────────────────┤
│              │ CVE-2024-4741  │          │ will_not_fix │                     │               │ openssl: Use After Free with SSL_free_buffers               │
│              │                │          │              │                     │               │ https://avd.aquasec.com/nvd/cve-2024-4741                   │
│              ├────────────────┤          │              │                     ├───────────────┼─────────────────────────────────────────────────────────────┤
│              │ CVE-2024-5535  │          │              │                     │               │ openssl: SSL_select_next_proto buffer overread              │
│              │                │          │              │                     │               │ https://avd.aquasec.com/nvd/cve-2024-5535                   │
├──────────────┼────────────────┤          │              ├─────────────────────┼───────────────┼─────────────────────────────────────────────────────────────┤
│ pcre2        │ CVE-2022-41409 │          │              │ 10.40-5.el9         │               │ pcre2: negative repeat value in a pcre2test subject line    │
│              │                │          │              │                     │               │ leads to inifinite...                                       │
│              │                │          │              │                     │               │ https://avd.aquasec.com/nvd/cve-2022-41409                  │
├──────────────┤                │          │              │                     ├───────────────┤                                                             │
│ pcre2-syntax │                │          │              │                     │               │                                                             │
│              │                │          │              │                     │               │                                                             │
│              │                │          │              │                     │               │                                                             │
├──────────────┼────────────────┼──────────┼──────────────┼─────────────────────┼───────────────┼─────────────────────────────────────────────────────────────┤
│ systemd-libs │ CVE-2021-3997  │ MEDIUM   │ affected     │ 252-32.el9_4.7      │               │ systemd: Uncontrolled recursion in systemd-tmpfiles when    │
│              │                │          │              │                     │               │ removing files                                              │
│              │                │          │              │                     │               │ https://avd.aquasec.com/nvd/cve-2021-3997                   │
└──────────────┴────────────────┴──────────┴──────────────┴─────────────────────┴───────────────┴─────────────────────────────────────────────────────────────┘
```

For comparison, the following are the scan results from the image `fluent/fluent-bit:latest`

```bash
fluent/fluent-bit (debian 12.7)

Total: 47 (UNKNOWN: 0, LOW: 27, MEDIUM: 14, HIGH: 5, CRITICAL: 1)

┌──────────────────┬──────────────────┬──────────┬──────────────┬───────────────────┬───────────────┬──────────────────────────────────────────────────────────────┐
│     Library      │  Vulnerability   │ Severity │    Status    │ Installed Version │ Fixed Version │                            Title                             │
├──────────────────┼──────────────────┼──────────┼──────────────┼───────────────────┼───────────────┼──────────────────────────────────────────────────────────────┤
│ libatomic1       │ CVE-2023-4039    │ MEDIUM   │ affected     │ 12.2.0-14         │               │ gcc: -fstack-protector fails to guard dynamic stack          │
│                  │                  │          │              │                   │               │ allocations on ARM64                                         │
│                  │                  │          │              │                   │               │ https://avd.aquasec.com/nvd/cve-2023-4039                    │
│                  ├──────────────────┼──────────┤              │                   ├───────────────┼──────────────────────────────────────────────────────────────┤
│                  │ CVE-2022-27943   │ LOW      │              │                   │               │ binutils: libiberty/rust-demangle.c in GNU GCC 11.2 allows   │
│                  │                  │          │              │                   │               │ stack exhaustion in demangle_const                           │
│                  │                  │          │              │                   │               │ https://avd.aquasec.com/nvd/cve-2022-27943                   │
├──────────────────┼──────────────────┤          │              ├───────────────────┼───────────────┼──────────────────────────────────────────────────────────────┤
│ libc6            │ CVE-2010-4756    │          │              │ 2.36-9+deb12u8    │               │ glibc: glob implementation can cause excessive CPU and       │
│                  │                  │          │              │                   │               │ memory consumption due to...                                 │
│                  │                  │          │              │                   │               │ https://avd.aquasec.com/nvd/cve-2010-4756                    │
│                  ├──────────────────┤          │              │                   ├───────────────┼──────────────────────────────────────────────────────────────┤
│                  │ CVE-2018-20796   │          │              │                   │               │ glibc: uncontrolled recursion in function                    │
│                  │                  │          │              │                   │               │ check_dst_limits_calc_pos_1 in posix/regexec.c               │
│                  │                  │          │              │                   │               │ https://avd.aquasec.com/nvd/cve-2018-20796                   │
│                  ├──────────────────┤          │              │                   ├───────────────┼──────────────────────────────────────────────────────────────┤
│                  │ CVE-2019-1010022 │          │              │                   │               │ glibc: stack guard protection bypass                         │
│                  │                  │          │              │                   │               │ https://avd.aquasec.com/nvd/cve-2019-1010022                 │
│                  ├──────────────────┤          │              │                   ├───────────────┼──────────────────────────────────────────────────────────────┤
│                  │ CVE-2019-1010023 │          │              │                   │               │ glibc: running ldd on malicious ELF leads to code execution  │
│                  │                  │          │              │                   │               │ because of...                                                │
│                  │                  │          │              │                   │               │ https://avd.aquasec.com/nvd/cve-2019-1010023                 │
│                  ├──────────────────┤          │              │                   ├───────────────┼──────────────────────────────────────────────────────────────┤
│                  │ CVE-2019-1010024 │          │              │                   │               │ glibc: ASLR bypass using cache of thread stack and heap      │
│                  │                  │          │              │                   │               │ https://avd.aquasec.com/nvd/cve-2019-1010024                 │
│                  ├──────────────────┤          │              │                   ├───────────────┼──────────────────────────────────────────────────────────────┤
│                  │ CVE-2019-1010025 │          │              │                   │               │ glibc: information disclosure of heap addresses of           │
│                  │                  │          │              │                   │               │ pthread_created thread                                       │
│                  │                  │          │              │                   │               │ https://avd.aquasec.com/nvd/cve-2019-1010025                 │
│                  ├──────────────────┤          │              │                   ├───────────────┼──────────────────────────────────────────────────────────────┤
│                  │ CVE-2019-9192    │          │              │                   │               │ glibc: uncontrolled recursion in function                    │
│                  │                  │          │              │                   │               │ check_dst_limits_calc_pos_1 in posix/regexec.c               │
│                  │                  │          │              │                   │               │ https://avd.aquasec.com/nvd/cve-2019-9192                    │
├──────────────────┼──────────────────┼──────────┤              ├───────────────────┼───────────────┼──────────────────────────────────────────────────────────────┤
│ libgcc-s1        │ CVE-2023-4039    │ MEDIUM   │              │ 12.2.0-14         │               │ gcc: -fstack-protector fails to guard dynamic stack          │
│                  │                  │          │              │                   │               │ allocations on ARM64                                         │
│                  │                  │          │              │                   │               │ https://avd.aquasec.com/nvd/cve-2023-4039                    │
│                  ├──────────────────┼──────────┤              │                   ├───────────────┼──────────────────────────────────────────────────────────────┤
│                  │ CVE-2022-27943   │ LOW      │              │                   │               │ binutils: libiberty/rust-demangle.c in GNU GCC 11.2 allows   │
│                  │                  │          │              │                   │               │ stack exhaustion in demangle_const                           │
│                  │                  │          │              │                   │               │ https://avd.aquasec.com/nvd/cve-2022-27943                   │
├──────────────────┼──────────────────┼──────────┤              ├───────────────────┼───────────────┼──────────────────────────────────────────────────────────────┤
│ libgcrypt20      │ CVE-2024-2236    │ MEDIUM   │              │ 1.10.1-3          │               │ libgcrypt: vulnerable to Marvin Attack                       │
│                  │                  │          │              │                   │               │ https://avd.aquasec.com/nvd/cve-2024-2236                    │
│                  ├──────────────────┼──────────┤              │                   ├───────────────┼──────────────────────────────────────────────────────────────┤
│                  │ CVE-2018-6829    │ LOW      │              │                   │               │ libgcrypt: ElGamal implementation doesn't have semantic      │
│                  │                  │          │              │                   │               │ security due to incorrectly encoded plaintexts...            │
│                  │                  │          │              │                   │               │ https://avd.aquasec.com/nvd/cve-2018-6829                    │
├──────────────────┼──────────────────┤          │              ├───────────────────┼───────────────┼──────────────────────────────────────────────────────────────┤
│ libgnutls30      │ CVE-2011-3389    │          │              │ 3.7.9-2+deb12u3   │               │ HTTPS: block-wise chosen-plaintext attack against SSL/TLS    │
│                  │                  │          │              │                   │               │ (BEAST)                                                      │
│                  │                  │          │              │                   │               │ https://avd.aquasec.com/nvd/cve-2011-3389                    │
├──────────────────┼──────────────────┼──────────┤              ├───────────────────┼───────────────┼──────────────────────────────────────────────────────────────┤
│ libgomp1         │ CVE-2023-4039    │ MEDIUM   │              │ 12.2.0-14         │               │ gcc: -fstack-protector fails to guard dynamic stack          │
│                  │                  │          │              │                   │               │ allocations on ARM64                                         │
│                  │                  │          │              │                   │               │ https://avd.aquasec.com/nvd/cve-2023-4039                    │
│                  ├──────────────────┼──────────┤              │                   ├───────────────┼──────────────────────────────────────────────────────────────┤
│                  │ CVE-2022-27943   │ LOW      │              │                   │               │ binutils: libiberty/rust-demangle.c in GNU GCC 11.2 allows   │
│                  │                  │          │              │                   │               │ stack exhaustion in demangle_const                           │
│                  │                  │          │              │                   │               │ https://avd.aquasec.com/nvd/cve-2022-27943                   │
├──────────────────┼──────────────────┼──────────┤              ├───────────────────┼───────────────┼──────────────────────────────────────────────────────────────┤
│ libgssapi-krb5-2 │ CVE-2024-26462   │ HIGH     │              │ 1.20.1-2+deb12u2  │               │ krb5: Memory leak at /krb5/src/kdc/ndr.c                     │
│                  │                  │          │              │                   │               │ https://avd.aquasec.com/nvd/cve-2024-26462                   │
│                  ├──────────────────┼──────────┤              │                   ├───────────────┼──────────────────────────────────────────────────────────────┤
│                  │ CVE-2024-26458   │ MEDIUM   │              │                   │               │ krb5: Memory leak at /krb5/src/lib/rpc/pmap_rmt.c            │
│                  │                  │          │              │                   │               │ https://avd.aquasec.com/nvd/cve-2024-26458                   │
│                  ├──────────────────┤          │              │                   ├───────────────┼──────────────────────────────────────────────────────────────┤
│                  │ CVE-2024-26461   │          │              │                   │               │ krb5: Memory leak at /krb5/src/lib/gssapi/krb5/k5sealv3.c    │
│                  │                  │          │              │                   │               │ https://avd.aquasec.com/nvd/cve-2024-26461                   │
│                  ├──────────────────┼──────────┤              │                   ├───────────────┼──────────────────────────────────────────────────────────────┤
│                  │ CVE-2018-5709    │ LOW      │              │                   │               │ krb5: integer overflow in dbentry->n_key_data in             │
│                  │                  │          │              │                   │               │ kadmin/dbutil/dump.c                                         │
│                  │                  │          │              │                   │               │ https://avd.aquasec.com/nvd/cve-2018-5709                    │
├──────────────────┼──────────────────┼──────────┤              │                   ├───────────────┼──────────────────────────────────────────────────────────────┤
│ libk5crypto3     │ CVE-2024-26462   │ HIGH     │              │                   │               │ krb5: Memory leak at /krb5/src/kdc/ndr.c                     │
│                  │                  │          │              │                   │               │ https://avd.aquasec.com/nvd/cve-2024-26462                   │
│                  ├──────────────────┼──────────┤              │                   ├───────────────┼──────────────────────────────────────────────────────────────┤
│                  │ CVE-2024-26458   │ MEDIUM   │              │                   │               │ krb5: Memory leak at /krb5/src/lib/rpc/pmap_rmt.c            │
│                  │                  │          │              │                   │               │ https://avd.aquasec.com/nvd/cve-2024-26458                   │
│                  ├──────────────────┤          │              │                   ├───────────────┼──────────────────────────────────────────────────────────────┤
│                  │ CVE-2024-26461   │          │              │                   │               │ krb5: Memory leak at /krb5/src/lib/gssapi/krb5/k5sealv3.c    │
│                  │                  │          │              │                   │               │ https://avd.aquasec.com/nvd/cve-2024-26461                   │
│                  ├──────────────────┼──────────┤              │                   ├───────────────┼──────────────────────────────────────────────────────────────┤
│                  │ CVE-2018-5709    │ LOW      │              │                   │               │ krb5: integer overflow in dbentry->n_key_data in             │
│                  │                  │          │              │                   │               │ kadmin/dbutil/dump.c                                         │
│                  │                  │          │              │                   │               │ https://avd.aquasec.com/nvd/cve-2018-5709                    │
├──────────────────┼──────────────────┼──────────┤              │                   ├───────────────┼──────────────────────────────────────────────────────────────┤
│ libkrb5-3        │ CVE-2024-26462   │ HIGH     │              │                   │               │ krb5: Memory leak at /krb5/src/kdc/ndr.c                     │
│                  │                  │          │              │                   │               │ https://avd.aquasec.com/nvd/cve-2024-26462                   │
│                  ├──────────────────┼──────────┤              │                   ├───────────────┼──────────────────────────────────────────────────────────────┤
│                  │ CVE-2024-26458   │ MEDIUM   │              │                   │               │ krb5: Memory leak at /krb5/src/lib/rpc/pmap_rmt.c            │
│                  │                  │          │              │                   │               │ https://avd.aquasec.com/nvd/cve-2024-26458                   │
│                  ├──────────────────┤          │              │                   ├───────────────┼──────────────────────────────────────────────────────────────┤
│                  │ CVE-2024-26461   │          │              │                   │               │ krb5: Memory leak at /krb5/src/lib/gssapi/krb5/k5sealv3.c    │
│                  │                  │          │              │                   │               │ https://avd.aquasec.com/nvd/cve-2024-26461                   │
│                  ├──────────────────┼──────────┤              │                   ├───────────────┼──────────────────────────────────────────────────────────────┤
│                  │ CVE-2018-5709    │ LOW      │              │                   │               │ krb5: integer overflow in dbentry->n_key_data in             │
│                  │                  │          │              │                   │               │ kadmin/dbutil/dump.c                                         │
│                  │                  │          │              │                   │               │ https://avd.aquasec.com/nvd/cve-2018-5709                    │
├──────────────────┼──────────────────┼──────────┤              │                   ├───────────────┼──────────────────────────────────────────────────────────────┤
│ libkrb5support0  │ CVE-2024-26462   │ HIGH     │              │                   │               │ krb5: Memory leak at /krb5/src/kdc/ndr.c                     │
│                  │                  │          │              │                   │               │ https://avd.aquasec.com/nvd/cve-2024-26462                   │
│                  ├──────────────────┼──────────┤              │                   ├───────────────┼──────────────────────────────────────────────────────────────┤
│                  │ CVE-2024-26458   │ MEDIUM   │              │                   │               │ krb5: Memory leak at /krb5/src/lib/rpc/pmap_rmt.c            │
│                  │                  │          │              │                   │               │ https://avd.aquasec.com/nvd/cve-2024-26458                   │
│                  ├──────────────────┤          │              │                   ├───────────────┼──────────────────────────────────────────────────────────────┤
│                  │ CVE-2024-26461   │          │              │                   │               │ krb5: Memory leak at /krb5/src/lib/gssapi/krb5/k5sealv3.c    │
│                  │                  │          │              │                   │               │ https://avd.aquasec.com/nvd/cve-2024-26461                   │
│                  ├──────────────────┼──────────┤              │                   ├───────────────┼──────────────────────────────────────────────────────────────┤
│                  │ CVE-2018-5709    │ LOW      │              │                   │               │ krb5: integer overflow in dbentry->n_key_data in             │
│                  │                  │          │              │                   │               │ kadmin/dbutil/dump.c                                         │
│                  │                  │          │              │                   │               │ https://avd.aquasec.com/nvd/cve-2018-5709                    │
├──────────────────┼──────────────────┼──────────┤              ├───────────────────┼───────────────┼──────────────────────────────────────────────────────────────┤
│ libldap-2.5-0    │ CVE-2023-2953    │ HIGH     │              │ 2.5.13+dfsg-5     │               │ openldap: null pointer dereference in ber_memalloc_x         │
│                  │                  │          │              │                   │               │ function                                                     │
│                  │                  │          │              │                   │               │ https://avd.aquasec.com/nvd/cve-2023-2953                    │
│                  ├──────────────────┼──────────┤              │                   ├───────────────┼──────────────────────────────────────────────────────────────┤
│                  │ CVE-2015-3276    │ LOW      │              │                   │               │ openldap: incorrect multi-keyword mode cipherstring parsing  │
│                  │                  │          │              │                   │               │ https://avd.aquasec.com/nvd/cve-2015-3276                    │
│                  ├──────────────────┤          │              │                   ├───────────────┼──────────────────────────────────────────────────────────────┤
│                  │ CVE-2017-14159   │          │              │                   │               │ openldap: Privilege escalation via PID file manipulation     │
│                  │                  │          │              │                   │               │ https://avd.aquasec.com/nvd/cve-2017-14159                   │
│                  ├──────────────────┤          │              │                   ├───────────────┼──────────────────────────────────────────────────────────────┤
│                  │ CVE-2017-17740   │          │              │                   │               │ openldap: contrib/slapd-modules/nops/nops.c attempts to free │
│                  │                  │          │              │                   │               │ stack buffer allowing remote attackers to cause...           │
│                  │                  │          │              │                   │               │ https://avd.aquasec.com/nvd/cve-2017-17740                   │
│                  ├──────────────────┤          │              │                   ├───────────────┼──────────────────────────────────────────────────────────────┤
│                  │ CVE-2020-15719   │          │              │                   │               │ openldap: Certificate validation incorrectly matches name    │
│                  │                  │          │              │                   │               │ against CN-ID                                                │
│                  │                  │          │              │                   │               │ https://avd.aquasec.com/nvd/cve-2020-15719                   │
├──────────────────┼──────────────────┤          │              ├───────────────────┼───────────────┼──────────────────────────────────────────────────────────────┤
│ libpq5           │ CVE-2024-4317    │          │              │ 15.8-0+deb12u1    │               │ postgresql: PostgreSQL pg_stats_ext and pg_stats_ext_exprs   │
│                  │                  │          │              │                   │               │ lack authorization checks                                    │
│                  │                  │          │              │                   │               │ https://avd.aquasec.com/nvd/cve-2024-4317                    │
├──────────────────┼──────────────────┼──────────┼──────────────┼───────────────────┼───────────────┼──────────────────────────────────────────────────────────────┤
│ libssl3          │ CVE-2024-5535    │ MEDIUM   │ fix_deferred │ 3.0.14-1~deb12u2  │               │ openssl: SSL_select_next_proto buffer overread               │
│                  │                  │          │              │                   │               │ https://avd.aquasec.com/nvd/cve-2024-5535                    │
│                  ├──────────────────┼──────────┤              │                   ├───────────────┼──────────────────────────────────────────────────────────────┤
│                  │ CVE-2024-9143    │ LOW      │              │                   │               │ openssl: Low-level invalid GF(2^m) parameters lead to OOB    │
│                  │                  │          │              │                   │               │ memory access                                                │
│                  │                  │          │              │                   │               │ https://avd.aquasec.com/nvd/cve-2024-9143                    │
├──────────────────┼──────────────────┼──────────┼──────────────┼───────────────────┼───────────────┼──────────────────────────────────────────────────────────────┤
│ libstdc++6       │ CVE-2023-4039    │ MEDIUM   │ affected     │ 12.2.0-14         │               │ gcc: -fstack-protector fails to guard dynamic stack          │
│                  │                  │          │              │                   │               │ allocations on ARM64                                         │
│                  │                  │          │              │                   │               │ https://avd.aquasec.com/nvd/cve-2023-4039                    │
│                  ├──────────────────┼──────────┤              │                   ├───────────────┼──────────────────────────────────────────────────────────────┤
│                  │ CVE-2022-27943   │ LOW      │              │                   │               │ binutils: libiberty/rust-demangle.c in GNU GCC 11.2 allows   │
│                  │                  │          │              │                   │               │ stack exhaustion in demangle_const                           │
│                  │                  │          │              │                   │               │ https://avd.aquasec.com/nvd/cve-2022-27943                   │
├──────────────────┼──────────────────┤          │              ├───────────────────┼───────────────┼──────────────────────────────────────────────────────────────┤
│ libsystemd0      │ CVE-2013-4392    │          │              │ 254.16-1~bpo12+1  │               │ systemd: TOCTOU race condition when updating file            │
│                  │                  │          │              │                   │               │ permissions and SELinux security contexts...                 │
│                  │                  │          │              │                   │               │ https://avd.aquasec.com/nvd/cve-2013-4392                    │
│                  ├──────────────────┤          │              │                   ├───────────────┼──────────────────────────────────────────────────────────────┤
│                  │ CVE-2023-31437   │          │              │                   │               │ An issue was discovered in systemd 253. An attacker can      │
│                  │                  │          │              │                   │               │ modify a...                                                  │
│                  │                  │          │              │                   │               │ https://avd.aquasec.com/nvd/cve-2023-31437                   │
│                  ├──────────────────┤          │              │                   ├───────────────┼──────────────────────────────────────────────────────────────┤
│                  │ CVE-2023-31438   │          │              │                   │               │ An issue was discovered in systemd 253. An attacker can      │
│                  │                  │          │              │                   │               │ truncate a...                                                │
│                  │                  │          │              │                   │               │ https://avd.aquasec.com/nvd/cve-2023-31438                   │
│                  ├──────────────────┤          │              │                   ├───────────────┼──────────────────────────────────────────────────────────────┤
│                  │ CVE-2023-31439   │          │              │                   │               │ An issue was discovered in systemd 253. An attacker can      │
│                  │                  │          │              │                   │               │ modify the...                                                │
│                  │                  │          │              │                   │               │ https://avd.aquasec.com/nvd/cve-2023-31439                   │
├──────────────────┼──────────────────┼──────────┼──────────────┼───────────────────┼───────────────┼──────────────────────────────────────────────────────────────┤
│ zlib1g           │ CVE-2023-45853   │ CRITICAL │ will_not_fix │ 1:1.2.13.dfsg-1   │               │ zlib: integer overflow and resultant heap-based buffer       │
│                  │                  │          │              │                   │               │ overflow in zipOpenNewFileInZip4_6                           │
│                  │                  │          │              │                   │               │ https://avd.aquasec.com/nvd/cve-2023-45853                   │
└──────────────────┴──────────────────┴──────────┴──────────────┴───────────────────┴───────────────┴──────────────────────────────────────────────────────────────┘
```
