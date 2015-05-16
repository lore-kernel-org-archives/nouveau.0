From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90482] Xorg take 100% CPU when using multiple
 independent screen configuration
Date: Sat, 16 May 2015 20:53:05 +0000
Message-ID: <bug-90482-8800-KGoacWqDSM@http.bugs.freedesktop.org/>
References: <bug-90482-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1626580929=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90482-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1626580929==
Content-Type: multipart/alternative; boundary="1431809585.Dd2ab1.8016"; charset="UTF-8"


--1431809585.Dd2ab1.8016
Date: Sat, 16 May 2015 20:53:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90482

--- Comment #3 from Matti Nykyri <matti.nykyri-X3B1VOXEql0@public.gmane.org> ---
and strace Xorg(PID 2954):
2954  select(256, [1 3 5 10 11 12 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32
33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58
59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81], NULL,
NULL, {264, 56000}) = 1 (in [12], left {264, 55981})
2954  select(256, [1 3 5 10 11 12 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32
33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58
59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81], NULL,
NULL, {264, 56000}) = 1 (in [12], left {264, 55981})
2954  select(256, [1 3 5 10 11 12 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32
33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58
59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81], NULL,
NULL, {264, 55000}) = 1 (in [12], left {264, 54982})
2954  select(256, [1 3 5 10 11 12 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32
33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58
59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81], NULL,
NULL, {264, 55000}) = 1 (in [12], left {264, 54981})
2954  select(256, [1 3 5 10 11 12 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32
33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58
59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81], NULL,
NULL, {264, 55000}) = 1 (in [12], left {264, 54981})
2954  select(256, [1 3 5 10 11 12 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32
33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58
59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81], NULL,
NULL, {264, 54000}) = 1 (in [12], left {264, 53982})
2954  select(256, [1 3 5 10 11 12 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32
33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58
59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81], NULL,
NULL, {264, 54000}) = 1 (in [12], left {264, 53982})
2954  select(256, [1 3 5 10 11 12 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32
33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58
59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81], NULL,
NULL, {264, 54000}) = 1 (in [12], left {264, 53981})
2954  select(256, [1 3 5 10 11 12 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32
33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58
59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81], NULL,
NULL, {264, 53000}) = 1 (in [12], left {264, 52981})
2954  select(256, [1 3 5 10 11 12 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32
33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58
59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81], NULL,
NULL, {264, 53000}) = 1 (in [12], left {264, 52981})
2954  select(256, [1 3 5 10 11 12 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32
33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58
59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81], NULL,
NULL, {264, 53000}) = 1 (in [12], left {264, 52981})
2954  select(256, [1 3 5 10 11 12 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32
33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58
59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81], NULL,
NULL, {264, 52000}) = 1 (in [12], left {264, 51981})
2954  select(256, [1 3 5 10 11 12 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32
33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58
59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81], NULL,
NULL, {264, 52000}) = 1 (in [12], left {264, 51981})
2954  select(256, [1 3 5 10 11 12 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32
33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58
59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81], NULL,
NULL, {264, 51000}) = 1 (in [12], left {264, 50982})
2954  select(256, [1 3 5 10 11 12 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32
33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58
59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81], NULL,
NULL, {264, 51000}) = 1 (in [12], left {264, 50983})
2954  select(256, [1 3 5 10 11 12 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32
33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58
59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81], NULL,
NULL, {264, 51000}) = 1 (in [12], left {264, 50983})
2954  select(256, [1 3 5 10 11 12 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32
33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58
59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81], NULL,
NULL, {264, 51000}) = 1 (in [12], left {264, 50983})

cat /proc/2954/fd:
0 l-wx------ 1 root root 64 May 16 23:47 0 -> /var/log/Xorg.0.log
0 lrwx------ 1 root root 64 May 16 23:47 1 -> socket:[12196]
0 lrwx------ 1 root root 64 May 16 23:47 10 -> /dev/dri/card0
0 lrwx------ 1 root root 64 May 16 23:47 11 -> socket:[1845]
0 lrwx------ 1 root root 64 May 16 23:47 12 -> socket:[1858]
0 lrwx------ 1 root root 64 May 16 23:47 13 -> /dev/dri/card0
0 lrwx------ 1 root root 64 May 16 23:47 14 -> /dev/input/event1
0 lrwx------ 1 root root 64 May 16 23:47 15 -> /dev/input/event0
0 lrwx------ 1 root root 64 May 16 23:47 16 -> /dev/input/event2
0 lrwx------ 1 root root 64 May 16 23:47 17 -> /dev/input/event3
0 lrwx------ 1 root root 64 May 16 23:47 18 -> socket:[2848]
....etc

lsof -p 2954:
X       2954 root    0w      REG                8,2   164675     262153
/var/log/Xorg.0.log
X       2954 root    1u     unix 0xffff880214864840      0t0      12196
@/tmp/.X11-unix/X0
X       2954 root    2w      REG                8,2    56795     262596
/var/log/kdm.log
X       2954 root    3u     unix 0xffff880214864c80      0t0      12197
/tmp/.X11-unix/X0
X       2954 root    4r      REG                8,2    31614     524293
/usr/lib64/xorg/protocol.txt
X       2954 root    5u  netlink                         0t0       2823
KOBJECT_UEVENT
X       2954 root    6w      REG                0,3        0 4026531961
/proc/mtrr
X       2954 root    7w      REG                0,3        0 4026531961
/proc/mtrr
X       2954 root    8u      CHR                4,7      0t0       2080
/dev/tty7
X       2954 root    9u      CHR              10,63      0t0       1026
/dev/vga_arbiter
X       2954 root   10u      CHR              226,0      0t0       1044
/dev/dri/card0
X       2954 root   11u     sock                0,6      0t0       1845
protocol: NETLINK
X       2954 root   12u  netlink                         0t0       1858
KOBJECT_UEVENT
X       2954 root   13u      CHR              226,0      0t0       1044
/dev/dri/card0
X       2954 root   14u      CHR              13,65      0t0       1082
/dev/input/event1
X       2954 root   15u      CHR              13,64      0t0      10912
/dev/input/event0
X       2954 root   16u      CHR              13,66      0t0       2447
/dev/input/event2
X       2954 root   17u      CHR              13,67      0t0       1323
/dev/input/event3
X       2954 root   18u     unix 0xffff8800d9839100      0t0       2848
@/tmp/.X11-unix/X0

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1431809585.Dd2ab1.8016
Date: Sat, 16 May 2015 20:53:05 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Xorg take 100% CPU when using multiple independent screen configuration"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90482#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Xorg take 100% CPU when using multiple independent screen configuration"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90482">bug 90482</a>
              from <span class="vcard"><a class="email" href="mailto:matti.nykyri&#64;iki.fi" title="Matti Nykyri &lt;matti.nykyri&#64;iki.fi&gt;"> <span class="fn">Matti Nykyri</span></a>
</span></b>
        <pre>and strace Xorg(PID 2954):
2954  select(256, [1 3 5 10 11 12 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32
33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58
59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81], NULL,
NULL, {264, 56000}) = 1 (in [12], left {264, 55981})
2954  select(256, [1 3 5 10 11 12 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32
33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58
59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81], NULL,
NULL, {264, 56000}) = 1 (in [12], left {264, 55981})
2954  select(256, [1 3 5 10 11 12 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32
33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58
59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81], NULL,
NULL, {264, 55000}) = 1 (in [12], left {264, 54982})
2954  select(256, [1 3 5 10 11 12 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32
33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58
59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81], NULL,
NULL, {264, 55000}) = 1 (in [12], left {264, 54981})
2954  select(256, [1 3 5 10 11 12 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32
33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58
59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81], NULL,
NULL, {264, 55000}) = 1 (in [12], left {264, 54981})
2954  select(256, [1 3 5 10 11 12 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32
33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58
59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81], NULL,
NULL, {264, 54000}) = 1 (in [12], left {264, 53982})
2954  select(256, [1 3 5 10 11 12 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32
33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58
59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81], NULL,
NULL, {264, 54000}) = 1 (in [12], left {264, 53982})
2954  select(256, [1 3 5 10 11 12 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32
33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58
59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81], NULL,
NULL, {264, 54000}) = 1 (in [12], left {264, 53981})
2954  select(256, [1 3 5 10 11 12 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32
33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58
59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81], NULL,
NULL, {264, 53000}) = 1 (in [12], left {264, 52981})
2954  select(256, [1 3 5 10 11 12 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32
33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58
59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81], NULL,
NULL, {264, 53000}) = 1 (in [12], left {264, 52981})
2954  select(256, [1 3 5 10 11 12 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32
33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58
59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81], NULL,
NULL, {264, 53000}) = 1 (in [12], left {264, 52981})
2954  select(256, [1 3 5 10 11 12 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32
33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58
59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81], NULL,
NULL, {264, 52000}) = 1 (in [12], left {264, 51981})
2954  select(256, [1 3 5 10 11 12 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32
33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58
59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81], NULL,
NULL, {264, 52000}) = 1 (in [12], left {264, 51981})
2954  select(256, [1 3 5 10 11 12 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32
33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58
59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81], NULL,
NULL, {264, 51000}) = 1 (in [12], left {264, 50982})
2954  select(256, [1 3 5 10 11 12 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32
33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58
59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81], NULL,
NULL, {264, 51000}) = 1 (in [12], left {264, 50983})
2954  select(256, [1 3 5 10 11 12 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32
33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58
59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81], NULL,
NULL, {264, 51000}) = 1 (in [12], left {264, 50983})
2954  select(256, [1 3 5 10 11 12 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32
33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58
59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81], NULL,
NULL, {264, 51000}) = 1 (in [12], left {264, 50983})

cat /proc/2954/fd:
0 l-wx------ 1 root root 64 May 16 23:47 0 -&gt; /var/log/Xorg.0.log
0 lrwx------ 1 root root 64 May 16 23:47 1 -&gt; socket:[12196]
0 lrwx------ 1 root root 64 May 16 23:47 10 -&gt; /dev/dri/card0
0 lrwx------ 1 root root 64 May 16 23:47 11 -&gt; socket:[1845]
0 lrwx------ 1 root root 64 May 16 23:47 12 -&gt; socket:[1858]
0 lrwx------ 1 root root 64 May 16 23:47 13 -&gt; /dev/dri/card0
0 lrwx------ 1 root root 64 May 16 23:47 14 -&gt; /dev/input/event1
0 lrwx------ 1 root root 64 May 16 23:47 15 -&gt; /dev/input/event0
0 lrwx------ 1 root root 64 May 16 23:47 16 -&gt; /dev/input/event2
0 lrwx------ 1 root root 64 May 16 23:47 17 -&gt; /dev/input/event3
0 lrwx------ 1 root root 64 May 16 23:47 18 -&gt; socket:[2848]
....etc

lsof -p 2954:
X       2954 root    0w      REG                8,2   164675     262153
/var/log/Xorg.0.log
X       2954 root    1u     unix 0xffff880214864840      0t0      12196
&#64;/tmp/.X11-unix/X0
X       2954 root    2w      REG                8,2    56795     262596
/var/log/kdm.log
X       2954 root    3u     unix 0xffff880214864c80      0t0      12197
/tmp/.X11-unix/X0
X       2954 root    4r      REG                8,2    31614     524293
/usr/lib64/xorg/protocol.txt
X       2954 root    5u  netlink                         0t0       2823
KOBJECT_UEVENT
X       2954 root    6w      REG                0,3        0 4026531961
/proc/mtrr
X       2954 root    7w      REG                0,3        0 4026531961
/proc/mtrr
X       2954 root    8u      CHR                4,7      0t0       2080
/dev/tty7
X       2954 root    9u      CHR              10,63      0t0       1026
/dev/vga_arbiter
X       2954 root   10u      CHR              226,0      0t0       1044
/dev/dri/card0
X       2954 root   11u     sock                0,6      0t0       1845
protocol: NETLINK
X       2954 root   12u  netlink                         0t0       1858
KOBJECT_UEVENT
X       2954 root   13u      CHR              226,0      0t0       1044
/dev/dri/card0
X       2954 root   14u      CHR              13,65      0t0       1082
/dev/input/event1
X       2954 root   15u      CHR              13,64      0t0      10912
/dev/input/event0
X       2954 root   16u      CHR              13,66      0t0       2447
/dev/input/event2
X       2954 root   17u      CHR              13,67      0t0       1323
/dev/input/event3
X       2954 root   18u     unix 0xffff8800d9839100      0t0       2848
&#64;/tmp/.X11-unix/X0</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1431809585.Dd2ab1.8016--

--===============1626580929==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1626580929==--
