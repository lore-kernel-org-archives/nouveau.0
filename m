From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 97462] Graphics deadlock "ILLEGAL_MTHD" in nouveau
 with mesa version 11.2.2 when visiting Google Maps with firefox 49.0b5
Date: Thu, 01 Sep 2016 06:47:42 +0000
Message-ID: <bug-97462-8800-bD8434z5qg@http.bugs.freedesktop.org/>
References: <bug-97462-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0349026494=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-97462-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0349026494==
Content-Type: multipart/alternative; boundary="14727124621.3fE19c45e.24058";
 charset="UTF-8"


--14727124621.3fE19c45e.24058
Date: Thu, 1 Sep 2016 06:47:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D97462

--- Comment #6 from wadev-cl+VPiYnx/0HWmgEVkV9KA@public.gmane.org ---
Sorry that I did not manage a proper install till today.
Seems that things changed somewhat.

Symptom is the same, but the message is now different.
Now I have this:

Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 0000000c
[INVALID_BITFIELD] ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd
0808 data 80000585
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 0000000c
[INVALID_BITFIELD] ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd
080c data 20010586
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 0000000c
[INVALID_BITFIELD] ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd
0810 data 04000004
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 0000000c
[INVALID_BITFIELD] ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd
0814 data 2002035d
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 00000004
[INVALID_VALUE] ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0=
81c
data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00040000 =
[]
ch 7 [007f9ed000 Compositor[5572]] subc 0 mthd 1618 data 04000004
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 0000000c
[INVALID_BITFIELD] ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd
0820 data 80000585
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00040000 =
[]
ch 7 [007f9ed000 Compositor[5572]] subc 0 mthd 0d74 data 00000400
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 0000000d
[BEGIN_END_ACTIVE] ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd
1618 data 04000004
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00040000 =
[]
ch 7 [007f9ed000 Compositor[5572]] subc 0 mthd 0000 data 00000000
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 0000000d
[BEGIN_END_ACTIVE] ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd
1614 data 00000000
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 0000000d
[BEGIN_END_ACTIVE] ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd
1614 data 00000000
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 0000000c
[INVALID_BITFIELD] ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd
1618 data 800004b3
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 3f000000
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 0000000d
[BEGIN_END_ACTIVE] ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd
1618 data 04000004
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00040000 =
[]
ch 7 [007f9ed000 Compositor[5572]] subc 0 mthd 0360 data 20164010
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra syslog-ng[3174]: I/O error occurred while reading;
fd=3D'14', error=3D'Broken pipe (32)'
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3eac data 00000=
006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3eb0 data 80000=
585
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3eb4 data 20010=
586
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3eb8 data 04000=
004
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3ebc data 20020=
35d
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3ec0 data 00000=
000
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3ec4 data 00000=
006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3ec8 data 80000=
585
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3ecc data 20010=
586
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3ed0 data 04000=
004
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3ed4 data 20020=
35d
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3ed8 data 00000=
000
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3edc data 00000=
006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3ee0 data 80000=
585
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3ee4 data 20010=
586
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3ee8 data 04000=
004
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3eec data 20020=
35d
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3ef0 data 00000=
000
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3ef4 data 00000=
006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3ef8 data 80000=
585
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3efc data 20010=
586
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f00 data 04000=
004
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f04 data 20020=
35d
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f08 data 00000=
000
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f0c data 00000=
006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f10 data 80000=
585
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f14 data 20010=
586
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f18 data 04000=
004
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f1c data 20020=
35d
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f20 data 00000=
000
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f24 data 00000=
006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f28 data 80000=
585
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f2c data 20010=
586
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f30 data 04000=
004
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f34 data 20020=
35d
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f38 data 00000=
000
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f3c data 00000=
006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f40 data 80000=
585
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f44 data 20010=
586
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f48 data 04000=
004
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f4c data 20020=
35d
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f50 data 00000=
000
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f54 data 00000=
006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f58 data 80000=
585
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f5c data 20010=
586
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f60 data 04000=
004
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f64 data 20020=
35d
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f68 data 00000=
000
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f6c data 00000=
006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f70 data 80000=
585
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f74 data 20010=
586
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f78 data 04000=
004
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f7c data 20020=
35d
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f80 data 00000=
000
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f84 data 00000=
006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f88 data 80000=
585
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f8c data 20010=
586
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f90 data 04000=
004
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f94 data 20020=
35d
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f98 data 00000=
000
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f9c data 00000=
006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3fa0 data 80000=
585
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3fa4 data 20010=
586
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3fa8 data 04000=
004
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3fac data 20020=
35d
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3fb0 data 00000=
000
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3fb4 data 00000=
006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3fb8 data 80000=
585
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3fbc data 20010=
586
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3fc0 data 04000=
004
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3fc4 data 20020=
35d
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3fc8 data 00000=
000
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3fcc data 00000=
006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3fd0 data 80000=
585
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3fd4 data 20010=
586
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3fd8 data 04000=
004
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3fdc data 20020=
35d
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3fe0 data 00000=
000
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3fe4 data 00000=
006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3fe8 data 80000=
585
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3fec data 20010=
586
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00840000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3ff0 data 04000=
004
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3ff4 data 20020=
35d
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3ff8 data 00000=
000
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3ffc data 00000=
006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000
[ILLEGAL_MTHD] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 000c data
2002035d
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 02000000 =
[]
ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 0020 data 04000004
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000
[ILLEGAL_MTHD] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 0030 data
80000585
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000
[ILLEGAL_MTHD] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 0034 data
20010586
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000
[ILLEGAL_MTHD] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 0038 data
04000004
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000
[ILLEGAL_MTHD] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 003c data
2002035d
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000
[ILLEGAL_MTHD] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 0040 data
00000000
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000
[ILLEGAL_MTHD] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 0044 data
00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000
[ILLEGAL_MTHD] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 0048 data
80000585
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000
[ILLEGAL_MTHD] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 004c data
20010586
Aug 31 16:41:58 terra kernel: nouveau 0000:01:00.0: gr: TRAP ch 7 [007f9ed0=
00
Compositor[5572]]
Aug 31 16:41:58 terra kernel: nouveau 0000:01:00.0: gr: ROP0 80000000 80000=
001
Aug 31 16:41:59 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000
[ILLEGAL_MTHD] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 0054 data
2002035d
Aug 31 16:41:59 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000
[ILLEGAL_MTHD] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 0058 data
00000000
Aug 31 16:41:59 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000
[ILLEGAL_MTHD] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 005c data
00000006
Aug 31 16:41:59 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000
[ILLEGAL_MTHD] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 0060 data
80000585
Aug 31 16:41:59 terra kernel: nouveau 0000:01:00.0: fifo: read fault at
0020010000 engine 07 [PFIFO] client 07 [BAR_READ] reason 00 [PT_NOT_PRESENT=
] on
channel 7 [007f9ed000 Compositor[5572]]
Aug 31 16:41:59 terra kernel: nouveau 0000:01:00.0: fifo: fifo engine fault=
 on
channel 7, recovering...
Aug 31 16:42:03 terra shutdown[6988]: shutting down for system halt

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--14727124621.3fE19c45e.24058
Date: Thu, 1 Sep 2016 06:47:42 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Graphics deadlock &quot;ILLEGAL_MTHD&quot; in nouveau wit=
h mesa version 11.2.2 when visiting Google Maps with firefox 49.0b5"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97462#c6">Comment=
 # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Graphics deadlock &quot;ILLEGAL_MTHD&quot; in nouveau wit=
h mesa version 11.2.2 when visiting Google Maps with firefox 49.0b5"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D97462">bug 97462<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
wadev&#64;mailbox.hu" title=3D"wadev&#64;mailbox.hu">wadev&#64;mailbox.hu</=
a>
</span></b>
        <pre>Sorry that I did not manage a proper install till today.
Seems that things changed somewhat.

Symptom is the same, but the message is now different.
Now I have this:

Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 0000000c
[INVALID_BITFIELD] ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd
0808 data 80000585
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 0000000c
[INVALID_BITFIELD] ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd
080c data 20010586
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 0000000c
[INVALID_BITFIELD] ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd
0810 data 04000004
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 0000000c
[INVALID_BITFIELD] ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd
0814 data 2002035d
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 00000004
[INVALID_VALUE] ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0=
81c
data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00040000 =
[]
ch 7 [007f9ed000 Compositor[5572]] subc 0 mthd 1618 data 04000004
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 0000000c
[INVALID_BITFIELD] ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd
0820 data 80000585
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00040000 =
[]
ch 7 [007f9ed000 Compositor[5572]] subc 0 mthd 0d74 data 00000400
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 0000000d
[BEGIN_END_ACTIVE] ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd
1618 data 04000004
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00040000 =
[]
ch 7 [007f9ed000 Compositor[5572]] subc 0 mthd 0000 data 00000000
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 0000000d
[BEGIN_END_ACTIVE] ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd
1614 data 00000000
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 0000000d
[BEGIN_END_ACTIVE] ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd
1614 data 00000000
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 0000000c
[INVALID_BITFIELD] ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd
1618 data 800004b3
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 3f000000
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 0000000d
[BEGIN_END_ACTIVE] ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd
1618 data 04000004
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00040000 =
[]
ch 7 [007f9ed000 Compositor[5572]] subc 0 mthd 0360 data 20164010
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: gr: DATA_ERROR 000000d2=
 []
ch 7 [007f9ed000 Compositor[5572]] subc 0 class 9297 mthd 0d78 data 00000006
Aug 31 16:41:52 terra syslog-ng[3174]: I/O error occurred while reading;
fd=3D'14', error=3D'Broken pipe (32)'
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3eac data 00000=
006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3eb0 data 80000=
585
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3eb4 data 20010=
586
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3eb8 data 04000=
004
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3ebc data 20020=
35d
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3ec0 data 00000=
000
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3ec4 data 00000=
006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3ec8 data 80000=
585
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3ecc data 20010=
586
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3ed0 data 04000=
004
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3ed4 data 20020=
35d
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3ed8 data 00000=
000
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3edc data 00000=
006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3ee0 data 80000=
585
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3ee4 data 20010=
586
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3ee8 data 04000=
004
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3eec data 20020=
35d
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3ef0 data 00000=
000
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3ef4 data 00000=
006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3ef8 data 80000=
585
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3efc data 20010=
586
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f00 data 04000=
004
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f04 data 20020=
35d
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f08 data 00000=
000
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f0c data 00000=
006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f10 data 80000=
585
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f14 data 20010=
586
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f18 data 04000=
004
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f1c data 20020=
35d
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f20 data 00000=
000
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f24 data 00000=
006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f28 data 80000=
585
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f2c data 20010=
586
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f30 data 04000=
004
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f34 data 20020=
35d
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f38 data 00000=
000
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f3c data 00000=
006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f40 data 80000=
585
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f44 data 20010=
586
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f48 data 04000=
004
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f4c data 20020=
35d
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f50 data 00000=
000
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f54 data 00000=
006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f58 data 80000=
585
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f5c data 20010=
586
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f60 data 04000=
004
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f64 data 20020=
35d
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f68 data 00000=
000
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f6c data 00000=
006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f70 data 80000=
585
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f74 data 20010=
586
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f78 data 04000=
004
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f7c data 20020=
35d
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f80 data 00000=
000
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f84 data 00000=
006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f88 data 80000=
585
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f8c data 20010=
586
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f90 data 04000=
004
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f94 data 20020=
35d
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f98 data 00000=
000
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3f9c data 00000=
006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3fa0 data 80000=
585
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3fa4 data 20010=
586
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3fa8 data 04000=
004
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3fac data 20020=
35d
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3fb0 data 00000=
000
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3fb4 data 00000=
006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3fb8 data 80000=
585
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3fbc data 20010=
586
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3fc0 data 04000=
004
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3fc4 data 20020=
35d
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3fc8 data 00000=
000
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3fcc data 00000=
006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3fd0 data 80000=
585
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3fd4 data 20010=
586
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3fd8 data 04000=
004
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3fdc data 20020=
35d
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3fe0 data 00000=
000
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3fe4 data 00000=
006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3fe8 data 80000=
585
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3fec data 20010=
586
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00840000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3ff0 data 04000=
004
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3ff4 data 20020=
35d
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3ff8 data 00000=
000
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00800000
[EMPTY_SUBC] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 3ffc data 00000=
006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000
[ILLEGAL_MTHD] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 000c data
2002035d
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 02000000 =
[]
ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 0020 data 04000004
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000
[ILLEGAL_MTHD] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 0030 data
80000585
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000
[ILLEGAL_MTHD] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 0034 data
20010586
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000
[ILLEGAL_MTHD] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 0038 data
04000004
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000
[ILLEGAL_MTHD] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 003c data
2002035d
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000
[ILLEGAL_MTHD] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 0040 data
00000000
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000
[ILLEGAL_MTHD] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 0044 data
00000006
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000
[ILLEGAL_MTHD] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 0048 data
80000585
Aug 31 16:41:52 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000
[ILLEGAL_MTHD] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 004c data
20010586
Aug 31 16:41:58 terra kernel: nouveau 0000:01:00.0: gr: TRAP ch 7 [007f9ed0=
00
Compositor[5572]]
Aug 31 16:41:58 terra kernel: nouveau 0000:01:00.0: gr: ROP0 80000000 80000=
001
Aug 31 16:41:59 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000
[ILLEGAL_MTHD] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 0054 data
2002035d
Aug 31 16:41:59 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000
[ILLEGAL_MTHD] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 0058 data
00000000
Aug 31 16:41:59 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000
[ILLEGAL_MTHD] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 005c data
00000006
Aug 31 16:41:59 terra kernel: nouveau 0000:01:00.0: fifo: PBDMA0: 00200000
[ILLEGAL_MTHD] ch 7 [007f9ed000 Compositor[5572]] subc 5 mthd 0060 data
80000585
Aug 31 16:41:59 terra kernel: nouveau 0000:01:00.0: fifo: read fault at
0020010000 engine 07 [PFIFO] client 07 [BAR_READ] reason 00 [PT_NOT_PRESENT=
] on
channel 7 [007f9ed000 Compositor[5572]]
Aug 31 16:41:59 terra kernel: nouveau 0000:01:00.0: fifo: fifo engine fault=
 on
channel 7, recovering...
Aug 31 16:42:03 terra shutdown[6988]: shutting down for system halt</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14727124621.3fE19c45e.24058--

--===============0349026494==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0349026494==--
