From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99396] New: Crash in nouveau_dri.so when switching
 apps with alt-tab in Gnome
Date: Fri, 13 Jan 2017 13:06:13 +0000
Message-ID: <bug-99396-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1658086678=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============1658086678==
Content-Type: multipart/alternative; boundary="14843127730.AB8a8fE32.24561";
 charset="UTF-8"


--14843127730.AB8a8fE32.24561
Date: Fri, 13 Jan 2017 13:06:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99396

            Bug ID: 99396
           Summary: Crash in nouveau_dri.so when switching apps with
                    alt-tab in Gnome
           Product: Mesa
           Version: git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: afn2-HmMyXyqgL2CVc3sceRu5cw@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Originally filed as a bug against Gnome
(https://bugzilla.gnome.org/show_bug.cgi?id=3D777183) but they directed me =
here.

Intermittently, gnome-shell will crash with SIGSEGV when switching apps with
alt-tab. See stack trace below.

Generally when this occurs, I'm running Firefox and Chromium, each with sev=
eral
windows open, and gnome-terminal. I'm not certain, but it seems to only hap=
pen
when I mouse over the app switcher.

I'm running gnome-shell 3.22.2+18+gdf7727a-1 on Arch.

Please let me know what other information I can gather! I'll update the bug=
 if
I can come up with a reproducible way to trigger the crash.

Jan 12 12:37:20 mbp systemd-coredump[8769]: Process 8422 (gnome-shell) of u=
ser
1000 dumped core.

                                            Stack trace of thread 8422:
                                            #0  0x00007f63b1771793
__memmove_avx_unaligned_erms (libc.so.6)
                                            #1  0x00007f639e0baf40 n/a
(nouveau_dri.so)
                                            #2  0x00007f639e1cb008 n/a
(nouveau_dri.so)
                                            #3  0x00007f639e1c0355 n/a
(nouveau_dri.so)
                                            #4  0x00007f639e1c0537 n/a
(nouveau_dri.so)
                                            #5  0x00007f639e1cc3c4 n/a
(nouveau_dri.so)
                                            #6  0x00007f639df1b922 n/a
(nouveau_dri.so)
                                            #7  0x00007f639ddc6690 n/a
(nouveau_dri.so)
                                            #8  0x00007f639dd763b7 n/a
(nouveau_dri.so)
                                            #9  0x00007f639dd7bab5 n/a
(nouveau_dri.so)
                                            #10 0x00007f639dd7c900 n/a
(nouveau_dri.so)
                                            #11 0x00007f639dd005e7 n/a
(nouveau_dri.so)
                                            #12 0x00007f639dd013e0 n/a
(nouveau_dri.so)
                                            #13 0x00007f63af0e44ed n/a
(libmutter-cogl.so)
                                            #14 0x00007f63af0d5b14 n/a
(libmutter-cogl.so)
                                            #15 0x00007f63af10ae56
cogl_texture_allocate (libmutter-cogl.so)
                                            #16 0x00007f63af12640b n/a
(libmutter-cogl.so)
                                            #17 0x00007f63af126909
cogl_texture_new_from_bitmap (libmutter-cogl.so)
                                            #18 0x00007f63b277e143 n/a
(libmutter-clutter-1.0.so)
                                            #19 0x00007f63b275a85d
clutter_actor_continue_paint (libmutter-clutter-1.0.so)
                                            #20 0x00007f63b2760aab n/a
(libmutter-clutter-1.0.so)
                                            #21 0x00007f63b463daa0 n/a
(libgnome-shell.so)
                                            #22 0x00007f63b1f26ecf
g_closure_invoke (libgobject-2.0.so.0)
                                            #23 0x00007f63b1f3937d n/a
(libgobject-2.0.so.0)
                                            #24 0x00007f63b1f41bcc
g_signal_emit_valist (libgobject-2.0.so.0)
                                            #25 0x00007f63b1f41faf
g_signal_emit (libgobject-2.0.so.0)
                                            #26 0x00007f63b275a8a3
clutter_actor_continue_paint (libmutter-clutter-1.0.so)
                                            #27 0x00007f63b2760aab n/a
(libmutter-clutter-1.0.so)
                                            #28 0x00007f63b4647f90 n/a
(libgnome-shell.so)
                                            #29 0x00007f63b1f26ecf
g_closure_invoke (libgobject-2.0.so.0)
                                            #30 0x00007f63b1f3937d n/a
(libgobject-2.0.so.0)
                                            #31 0x00007f63b1f41bcc
g_signal_emit_valist (libgobject-2.0.so.0)
                                            #32 0x00007f63b1f41faf
g_signal_emit (libgobject-2.0.so.0)
                                            #33 0x00007f63b275a8a3
clutter_actor_continue_paint (libmutter-clutter-1.0.so)
                                            #34 0x00007f63b2760aab n/a
(libmutter-clutter-1.0.so)
                                            #35 0x00007f63b4656182 n/a
(libgnome-shell.so)
                                            #36 0x00007f63b1f26ecf
g_closure_invoke (libgobject-2.0.so.0)
                                            #37 0x00007f63b1f3937d n/a
(libgobject-2.0.so.0)
                                            #37 0x00007f63b1f3937d n/a
(libgobject-2.0.so.0)
                                            #38 0x00007f63b1f41bcc
g_signal_emit_valist (libgobject-2.0.so.0)
                                            #39 0x00007f63b1f41faf
g_signal_emit (libgobject-2.0.so.0)
                                            #40 0x00007f63b275a8a3
clutter_actor_continue_paint (libmutter-clutter-1.0.so)
                                            #41 0x00007f63b2760706 n/a
(libmutter-clutter-1.0.so)
                                            #42 0x00007f63b463daa0 n/a
(libgnome-shell.so)
                                            #43 0x00007f63b1f26ecf
g_closure_invoke (libgobject-2.0.so.0)
                                            #44 0x00007f63b1f3937d n/a
(libgobject-2.0.so.0)
                                            #45 0x00007f63b1f41bcc
g_signal_emit_valist (libgobject-2.0.so.0)
                                            #46 0x00007f63b1f41faf
g_signal_emit (libgobject-2.0.so.0)
                                            #47 0x00007f63b275a8a3
clutter_actor_continue_paint (libmutter-clutter-1.0.so)
                                            #48 0x00007f63b2760aab n/a
(libmutter-clutter-1.0.so)
                                            #49 0x00007f63b463daa0 n/a
(libgnome-shell.so)
                                            #50 0x00007f63b1f26ecf
g_closure_invoke (libgobject-2.0.so.0)
                                            #51 0x00007f63b1f3937d n/a
(libgobject-2.0.so.0)
                                            #52 0x00007f63b1f41bcc
g_signal_emit_valist (libgobject-2.0.so.0)
                                            #53 0x00007f63b1f41faf
g_signal_emit (libgobject-2.0.so.0)
                                            #54 0x00007f63b275a8a3
clutter_actor_continue_paint (libmutter-clutter-1.0.so)
                                            #55 0x00007f63b2760aab n/a
(libmutter-clutter-1.0.so)
                                            #56 0x00007f63b463daa0 n/a
(libgnome-shell.so)
                                            #57 0x00007f63b1f26ecf
g_closure_invoke (libgobject-2.0.so.0)
                                            #58 0x00007f63b1f3937d n/a
(libgobject-2.0.so.0)
                                            #59 0x00007f63b1f41bcc
g_signal_emit_valist (libgobject-2.0.so.0)
                                            #60 0x00007f63b1f41faf
g_signal_emit (libgobject-2.0.so.0)
                                            #61 0x00007f63b275a8a3
clutter_actor_continue_paint (libmutter-clutter-1.0.so)
                                            #62 0x00007f63b2760aab n/a
(libmutter-clutter-1.0.so)
                                            #63 0x00007f63b27b347a n/a
(libmutter-clutter-1.0.so)

                                            Stack trace of thread 8432:
                                            #0  0x00007f63b172848d poll
(libc.so.6)
                                            #1  0x00007f63ada92ee1 n/a
(libpulse.so.0)
                                            #2  0x00007f63ada846f1
pa_mainloop_poll (libpulse.so.0)
                                            #3  0x00007f63ada84d8e
pa_mainloop_iterate (libpulse.so.0)
                                            #4  0x00007f63ada84e40
pa_mainloop_run (libpulse.so.0)
                                            #5  0x00007f63ada92e29 n/a
(libpulse.so.0)
                                            #6  0x00007f63a31fcfe8 n/a
(libpulsecommon-9.99.so)
                                            #7  0x00007f63b19ee454 start_th=
read
(libpthread.so.0)
                                            #8  0x00007f63b17317df __clone
(libc.so.6)

                                            Stack trace of thread 8434:
                                            #0  0x00007f63b19f410f
pthread_cond_wait@@GLIBC_2.3.2 (libpthread.so.0)
                                            #1  0x00007f63a492d4e0
PR_WaitCondVar (libnspr4.so)
                                            #2  0x00007f63ad55cbab n/a
(libmozjs-24.so)
                                            #3  0x00007f63a4932d6c n/a
(libnspr4.so)
                                            #4  0x00007f63b19ee454 start_th=
read
(libpthread.so.0)
                                            #5  0x00007f63b17317df __clone
(libc.so.6)

                                            Stack trace of thread 8424:
                                            #0  0x00007f63b172848d poll
(libc.so.6)
                                            #1  0x00007f63b1c4e786 n/a
(libglib-2.0.so.0)
                                            #2  0x00007f63b1c4e89c
g_main_context_iteration (libglib-2.0.so.0)
                                            #3  0x00007f63b1c4e8e1 n/a
(libglib-2.0.so.0)
                                            #4  0x00007f63b1c760d5 n/a
(libglib-2.0.so.0)
                                            #5  0x00007f63b19ee454 start_th=
read
(libpthread.so.0)
                                            #6  0x00007f63b17317df __clone
(libc.so.6)

                                            Stack trace of thread 8433:
                                            #0  0x00007f63b19f410f
pthread_cond_wait@@GLIBC_2.3.2 (libpthread.so.0)
                                            #1  0x00007f63a492d4e0
PR_WaitCondVar (libnspr4.so)
                                            #2  0x00007f63ad4e8c0e n/a
(libmozjs-24.so)
                                            #3  0x00007f63a4932d6c n/a
(libnspr4.so)
                                            #4  0x00007f63b19ee454 start_th=
read
(libpthread.so.0)
                                            #5  0x00007f63b17317df __clone
(libc.so.6)

                                            Stack trace of thread 8767:
                                            #0  0x00007f63b172cf19 syscall
(libc.so.6)
                                            #1  0x00007f63b1c9403a
g_cond_wait_until (libglib-2.0.so.0)
                                            #2  0x00007f63b1c22e89 n/a
(libglib-2.0.so.0)
                                            #3  0x00007f63b1c76aa6 n/a
(libglib-2.0.so.0)
                                            #4  0x00007f63b1c760d5 n/a
(libglib-2.0.so.0)
                                            #5  0x00007f63b19ee454 start_th=
read
(libpthread.so.0)
                                            #6  0x00007f63b17317df __clone
(libc.so.6)

                                            Stack trace of thread 8429:
                                            #0  0x00007f63b172848d poll
(libc.so.6)
                                            #1  0x00007f63b1c4e786 n/a
(libglib-2.0.so.0)
                                            #2  0x00007f63b1c4e89c
g_main_context_iteration (libglib-2.0.so.0)
                                            #3  0x00007f639c2404bd n/a
(libdconfsettings.so)
                                            #4  0x00007f63b1c760d5 n/a
(libglib-2.0.so.0)
                                            #5  0x00007f63b19ee454 start_th=
read
(libpthread.so.0)
                                            #6  0x00007f63b17317df __clone
(libc.so.6)

                                            Stack trace of thread 8425:
                                            #0  0x00007f63b172848d poll
(libc.so.6)
                                            #1  0x00007f63b1c4e786 n/a
(libglib-2.0.so.0)
                                            #2  0x00007f63b1c4eb12
g_main_loop_run (libglib-2.0.so.0)
                                            #3  0x00007f63b2234316 n/a
(libgio-2.0.so.0)
                                            #4  0x00007f63b1c760d5 n/a
(libglib-2.0.so.0)
                                            #5  0x00007f63b19ee454 start_th=
read
(libpthread.so.0)
                                            #6  0x00007f63b17317df __clone
(libc.so.6)

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14843127730.AB8a8fE32.24561
Date: Fri, 13 Jan 2017 13:06:13 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crash in nouveau_dri.so when switching apps with alt-tab =
in Gnome"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99396">99396</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Crash in nouveau_dri.so when switching apps with alt-tab in G=
nome
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>afn2&#64;cornell.edu
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Originally filed as a bug against Gnome
(<a href=3D"https://bugzilla.gnome.org/show_bug.cgi?id=3D777183">https://bu=
gzilla.gnome.org/show_bug.cgi?id=3D777183</a>) but they directed me here.

Intermittently, gnome-shell will crash with SIGSEGV when switching apps with
alt-tab. See stack trace below.

Generally when this occurs, I'm running Firefox and Chromium, each with sev=
eral
windows open, and gnome-terminal. I'm not certain, but it seems to only hap=
pen
when I mouse over the app switcher.

I'm running gnome-shell 3.22.2+18+gdf7727a-1 on Arch.

Please let me know what other information I can gather! I'll update the bug=
 if
I can come up with a reproducible way to trigger the crash.

Jan 12 12:37:20 mbp systemd-coredump[8769]: Process 8422 (gnome-shell) of u=
ser
1000 dumped core.

                                            Stack trace of thread 8422:
                                            #0  0x00007f63b1771793
__memmove_avx_unaligned_erms (libc.so.6)
                                            #1  0x00007f639e0baf40 n/a
(nouveau_dri.so)
                                            #2  0x00007f639e1cb008 n/a
(nouveau_dri.so)
                                            #3  0x00007f639e1c0355 n/a
(nouveau_dri.so)
                                            #4  0x00007f639e1c0537 n/a
(nouveau_dri.so)
                                            #5  0x00007f639e1cc3c4 n/a
(nouveau_dri.so)
                                            #6  0x00007f639df1b922 n/a
(nouveau_dri.so)
                                            #7  0x00007f639ddc6690 n/a
(nouveau_dri.so)
                                            #8  0x00007f639dd763b7 n/a
(nouveau_dri.so)
                                            #9  0x00007f639dd7bab5 n/a
(nouveau_dri.so)
                                            #10 0x00007f639dd7c900 n/a
(nouveau_dri.so)
                                            #11 0x00007f639dd005e7 n/a
(nouveau_dri.so)
                                            #12 0x00007f639dd013e0 n/a
(nouveau_dri.so)
                                            #13 0x00007f63af0e44ed n/a
(libmutter-cogl.so)
                                            #14 0x00007f63af0d5b14 n/a
(libmutter-cogl.so)
                                            #15 0x00007f63af10ae56
cogl_texture_allocate (libmutter-cogl.so)
                                            #16 0x00007f63af12640b n/a
(libmutter-cogl.so)
                                            #17 0x00007f63af126909
cogl_texture_new_from_bitmap (libmutter-cogl.so)
                                            #18 0x00007f63b277e143 n/a
(libmutter-clutter-1.0.so)
                                            #19 0x00007f63b275a85d
clutter_actor_continue_paint (libmutter-clutter-1.0.so)
                                            #20 0x00007f63b2760aab n/a
(libmutter-clutter-1.0.so)
                                            #21 0x00007f63b463daa0 n/a
(libgnome-shell.so)
                                            #22 0x00007f63b1f26ecf
g_closure_invoke (libgobject-2.0.so.0)
                                            #23 0x00007f63b1f3937d n/a
(libgobject-2.0.so.0)
                                            #24 0x00007f63b1f41bcc
g_signal_emit_valist (libgobject-2.0.so.0)
                                            #25 0x00007f63b1f41faf
g_signal_emit (libgobject-2.0.so.0)
                                            #26 0x00007f63b275a8a3
clutter_actor_continue_paint (libmutter-clutter-1.0.so)
                                            #27 0x00007f63b2760aab n/a
(libmutter-clutter-1.0.so)
                                            #28 0x00007f63b4647f90 n/a
(libgnome-shell.so)
                                            #29 0x00007f63b1f26ecf
g_closure_invoke (libgobject-2.0.so.0)
                                            #30 0x00007f63b1f3937d n/a
(libgobject-2.0.so.0)
                                            #31 0x00007f63b1f41bcc
g_signal_emit_valist (libgobject-2.0.so.0)
                                            #32 0x00007f63b1f41faf
g_signal_emit (libgobject-2.0.so.0)
                                            #33 0x00007f63b275a8a3
clutter_actor_continue_paint (libmutter-clutter-1.0.so)
                                            #34 0x00007f63b2760aab n/a
(libmutter-clutter-1.0.so)
                                            #35 0x00007f63b4656182 n/a
(libgnome-shell.so)
                                            #36 0x00007f63b1f26ecf
g_closure_invoke (libgobject-2.0.so.0)
                                            #37 0x00007f63b1f3937d n/a
(libgobject-2.0.so.0)
                                            #37 0x00007f63b1f3937d n/a
(libgobject-2.0.so.0)
                                            #38 0x00007f63b1f41bcc
g_signal_emit_valist (libgobject-2.0.so.0)
                                            #39 0x00007f63b1f41faf
g_signal_emit (libgobject-2.0.so.0)
                                            #40 0x00007f63b275a8a3
clutter_actor_continue_paint (libmutter-clutter-1.0.so)
                                            #41 0x00007f63b2760706 n/a
(libmutter-clutter-1.0.so)
                                            #42 0x00007f63b463daa0 n/a
(libgnome-shell.so)
                                            #43 0x00007f63b1f26ecf
g_closure_invoke (libgobject-2.0.so.0)
                                            #44 0x00007f63b1f3937d n/a
(libgobject-2.0.so.0)
                                            #45 0x00007f63b1f41bcc
g_signal_emit_valist (libgobject-2.0.so.0)
                                            #46 0x00007f63b1f41faf
g_signal_emit (libgobject-2.0.so.0)
                                            #47 0x00007f63b275a8a3
clutter_actor_continue_paint (libmutter-clutter-1.0.so)
                                            #48 0x00007f63b2760aab n/a
(libmutter-clutter-1.0.so)
                                            #49 0x00007f63b463daa0 n/a
(libgnome-shell.so)
                                            #50 0x00007f63b1f26ecf
g_closure_invoke (libgobject-2.0.so.0)
                                            #51 0x00007f63b1f3937d n/a
(libgobject-2.0.so.0)
                                            #52 0x00007f63b1f41bcc
g_signal_emit_valist (libgobject-2.0.so.0)
                                            #53 0x00007f63b1f41faf
g_signal_emit (libgobject-2.0.so.0)
                                            #54 0x00007f63b275a8a3
clutter_actor_continue_paint (libmutter-clutter-1.0.so)
                                            #55 0x00007f63b2760aab n/a
(libmutter-clutter-1.0.so)
                                            #56 0x00007f63b463daa0 n/a
(libgnome-shell.so)
                                            #57 0x00007f63b1f26ecf
g_closure_invoke (libgobject-2.0.so.0)
                                            #58 0x00007f63b1f3937d n/a
(libgobject-2.0.so.0)
                                            #59 0x00007f63b1f41bcc
g_signal_emit_valist (libgobject-2.0.so.0)
                                            #60 0x00007f63b1f41faf
g_signal_emit (libgobject-2.0.so.0)
                                            #61 0x00007f63b275a8a3
clutter_actor_continue_paint (libmutter-clutter-1.0.so)
                                            #62 0x00007f63b2760aab n/a
(libmutter-clutter-1.0.so)
                                            #63 0x00007f63b27b347a n/a
(libmutter-clutter-1.0.so)

                                            Stack trace of thread 8432:
                                            #0  0x00007f63b172848d poll
(libc.so.6)
                                            #1  0x00007f63ada92ee1 n/a
(libpulse.so.0)
                                            #2  0x00007f63ada846f1
pa_mainloop_poll (libpulse.so.0)
                                            #3  0x00007f63ada84d8e
pa_mainloop_iterate (libpulse.so.0)
                                            #4  0x00007f63ada84e40
pa_mainloop_run (libpulse.so.0)
                                            #5  0x00007f63ada92e29 n/a
(libpulse.so.0)
                                            #6  0x00007f63a31fcfe8 n/a
(libpulsecommon-9.99.so)
                                            #7  0x00007f63b19ee454 start_th=
read
(libpthread.so.0)
                                            #8  0x00007f63b17317df __clone
(libc.so.6)

                                            Stack trace of thread 8434:
                                            #0  0x00007f63b19f410f
pthread_cond_wait&#64;&#64;GLIBC_2.3.2 (libpthread.so.0)
                                            #1  0x00007f63a492d4e0
PR_WaitCondVar (libnspr4.so)
                                            #2  0x00007f63ad55cbab n/a
(libmozjs-24.so)
                                            #3  0x00007f63a4932d6c n/a
(libnspr4.so)
                                            #4  0x00007f63b19ee454 start_th=
read
(libpthread.so.0)
                                            #5  0x00007f63b17317df __clone
(libc.so.6)

                                            Stack trace of thread 8424:
                                            #0  0x00007f63b172848d poll
(libc.so.6)
                                            #1  0x00007f63b1c4e786 n/a
(libglib-2.0.so.0)
                                            #2  0x00007f63b1c4e89c
g_main_context_iteration (libglib-2.0.so.0)
                                            #3  0x00007f63b1c4e8e1 n/a
(libglib-2.0.so.0)
                                            #4  0x00007f63b1c760d5 n/a
(libglib-2.0.so.0)
                                            #5  0x00007f63b19ee454 start_th=
read
(libpthread.so.0)
                                            #6  0x00007f63b17317df __clone
(libc.so.6)

                                            Stack trace of thread 8433:
                                            #0  0x00007f63b19f410f
pthread_cond_wait&#64;&#64;GLIBC_2.3.2 (libpthread.so.0)
                                            #1  0x00007f63a492d4e0
PR_WaitCondVar (libnspr4.so)
                                            #2  0x00007f63ad4e8c0e n/a
(libmozjs-24.so)
                                            #3  0x00007f63a4932d6c n/a
(libnspr4.so)
                                            #4  0x00007f63b19ee454 start_th=
read
(libpthread.so.0)
                                            #5  0x00007f63b17317df __clone
(libc.so.6)

                                            Stack trace of thread 8767:
                                            #0  0x00007f63b172cf19 syscall
(libc.so.6)
                                            #1  0x00007f63b1c9403a
g_cond_wait_until (libglib-2.0.so.0)
                                            #2  0x00007f63b1c22e89 n/a
(libglib-2.0.so.0)
                                            #3  0x00007f63b1c76aa6 n/a
(libglib-2.0.so.0)
                                            #4  0x00007f63b1c760d5 n/a
(libglib-2.0.so.0)
                                            #5  0x00007f63b19ee454 start_th=
read
(libpthread.so.0)
                                            #6  0x00007f63b17317df __clone
(libc.so.6)

                                            Stack trace of thread 8429:
                                            #0  0x00007f63b172848d poll
(libc.so.6)
                                            #1  0x00007f63b1c4e786 n/a
(libglib-2.0.so.0)
                                            #2  0x00007f63b1c4e89c
g_main_context_iteration (libglib-2.0.so.0)
                                            #3  0x00007f639c2404bd n/a
(libdconfsettings.so)
                                            #4  0x00007f63b1c760d5 n/a
(libglib-2.0.so.0)
                                            #5  0x00007f63b19ee454 start_th=
read
(libpthread.so.0)
                                            #6  0x00007f63b17317df __clone
(libc.so.6)

                                            Stack trace of thread 8425:
                                            #0  0x00007f63b172848d poll
(libc.so.6)
                                            #1  0x00007f63b1c4e786 n/a
(libglib-2.0.so.0)
                                            #2  0x00007f63b1c4eb12
g_main_loop_run (libglib-2.0.so.0)
                                            #3  0x00007f63b2234316 n/a
(libgio-2.0.so.0)
                                            #4  0x00007f63b1c760d5 n/a
(libglib-2.0.so.0)
                                            #5  0x00007f63b19ee454 start_th=
read
(libpthread.so.0)
                                            #6  0x00007f63b17317df __clone
(libc.so.6)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--14843127730.AB8a8fE32.24561--

--===============1658086678==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1658086678==--
