$NetBSD: patch-library_std_src_sys_unix_mod.rs,v 1.5 2022/10/10 20:34:15 he Exp $

Add libexecinfo for backtrace() on NetBSD.

--- library/std/src/sys/unix/mod.rs.orig	2021-02-10 17:36:44.000000000 +0000
+++ library/std/src/sys/unix/mod.rs
@@ -302,6 +302,7 @@ cfg_if::cfg_if! {
         #[link(name = "pthread")]
         extern "C" {}
     } else if #[cfg(target_os = "netbsd")] {
+        #[link(name = "execinfo")]
         #[link(name = "pthread")]
         #[link(name = "rt")]
         extern "C" {}
