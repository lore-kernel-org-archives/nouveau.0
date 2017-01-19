From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 99396] Crash in nouveau_dri.so when switching apps
 with alt-tab in Gnome
Date: Thu, 19 Jan 2017 04:29:04 +0000
Message-ID: <bug-99396-8800-vb2ISnPttm@http.bugs.freedesktop.org/>
References: <bug-99396-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0302233703=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-99396-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0302233703==
Content-Type: multipart/alternative; boundary="14848001440.0De5e05EA.3215";
 charset="UTF-8"


--14848001440.0De5e05EA.3215
Date: Thu, 19 Jan 2017 04:29:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D99396

--- Comment #4 from afn2-HmMyXyqgL2CVc3sceRu5cw@public.gmane.org ---
Thanks for the reply, Ilia. The video card is a GeForce 750M (GK107) in a
mid-2014 MacBook Pro Retina.

I rebuilt the library without stripping symbols and then reproduced the cra=
sh.
Here's an updated stack trace. Luckily it doesn't appear that there are
multiple threads doing GL work:

Jan 18 23:22:24 mbp systemd-coredump[23240]: Process 23187 (gnome-shell) of
user 1000 dumped core.

Stack trace of thread 23187:
#0  0x00007f8e82236793 __memmove_avx_unaligned_erms (libc.so.6)
#1  0x00007f8e6eb59160 nouveau_scratch_data (nouveau_dri.so)
#2  0x00007f8e6ec65b58 nvc0_update_user_vbufs_shared (nouveau_dri.so)
#3  0x00007f8e6ec5aea5 nvc0_state_validate (nouveau_dri.so)
#4  0x00007f8e6ec5b087 nvc0_state_validate_3d (nouveau_dri.so)
#5  0x00007f8e6ec66f14 nvc0_draw_vbo (nouveau_dri.so)
#6  0x00007f8e6e9bfe12 cso_draw_arrays (nouveau_dri.so)
#7  0x00007f8e6e8773d0 st_pbo_draw (nouveau_dri.so)
#8  0x00007f8e6e82e897 try_pbo_upload_common (nouveau_dri.so)
#9  0x00007f8e6e833f95 st_TexSubImage (nouveau_dri.so)
#10 0x00007f8e6e834de0 st_TexImage (nouveau_dri.so)
#11 0x00007f8e6e7b8f47 teximage (nouveau_dri.so)
#12 0x00007f8e6e7b9d40 _mesa_TexImage2D (nouveau_dri.so)
#13 0x00007f8e7fba94ed n/a (libmutter-cogl.so)
#14 0x00007f8e7fb9ab14 n/a (libmutter-cogl.so)
#15 0x00007f8e7fbcfe56 cogl_texture_allocate (libmutter-cogl.so)
#16 0x00007f8e7fbeb40b n/a (libmutter-cogl.so)
#17 0x00007f8e7fbeb909 cogl_texture_new_from_bitmap (libmutter-cogl.so)
#18 0x00007f8e83243143 n/a (libmutter-clutter-1.0.so)
#19 0x00007f8e8321f85d clutter_actor_continue_paint (libmutter-clutter-1.0.=
so)
#20 0x00007f8e83225aab n/a (libmutter-clutter-1.0.so)
#21 0x00007f8e85102aa0 n/a (libgnome-shell.so)
#22 0x00007f8e829ebecf g_closure_invoke (libgobject-2.0.so.0)
#23 0x00007f8e829fe37d n/a (libgobject-2.0.so.0)
#24 0x00007f8e82a06bcc g_signal_emit_valist (libgobject-2.0.so.0)
#25 0x00007f8e82a06faf g_signal_emit (libgobject-2.0.so.0)
#26 0x00007f8e8321f8a3 clutter_actor_continue_paint (libmutter-clutter-1.0.=
so)
#27 0x00007f8e83225aab n/a (libmutter-clutter-1.0.so)
#28 0x00007f8e8510cf90 n/a (libgnome-shell.so)
#29 0x00007f8e829ebecf g_closure_invoke (libgobject-2.0.so.0)
#30 0x00007f8e829fe37d n/a (libgobject-2.0.so.0)
#31 0x00007f8e82a06bcc g_signal_emit_valist (libgobject-2.0.so.0)
#32 0x00007f8e82a06faf g_signal_emit (libgobject-2.0.so.0)
#33 0x00007f8e8321f8a3 clutter_actor_continue_paint (libmutter-clutter-1.0.=
so)
#34 0x00007f8e83225aab n/a (libmutter-clutter-1.0.so)
#35 0x00007f8e8511b182 n/a (libgnome-shell.so)
#36 0x00007f8e829ebecf g_closure_invoke (libgobject-2.0.so.0)
#37 0x00007f8e829fe37d n/a (libgobject-2.0.so.0)
#38 0x00007f8e82a06bcc g_signal_emit_valist (libgobject-2.0.so.0)
#39 0x00007f8e82a06faf g_signal_emit (libgobject-2.0.so.0)
#40 0x00007f8e8321f8a3 clutter_actor_continue_paint (libmutter-clutter-1.0.=
so)
#41 0x00007f8e83225706 n/a (libmutter-clutter-1.0.so)
#42 0x00007f8e85102aa0 n/a (libgnome-shell.so)
#43 0x00007f8e829ebecf g_closure_invoke (libgobject-2.0.so.0)
#44 0x00007f8e829fe37d n/a (libgobject-2.0.so.0)
#45 0x00007f8e82a06bcc g_signal_emit_valist (libgobject-2.0.so.0)
#46 0x00007f8e82a06faf g_signal_emit (libgobject-2.0.so.0)
#47 0x00007f8e8321f8a3 clutter_actor_continue_paint (libmutter-clutter-1.0.=
so)
#48 0x00007f8e83225aab n/a (libmutter-clutter-1.0.so)
#49 0x00007f8e85102aa0 n/a (libgnome-shell.so)
#50 0x00007f8e829ebecf g_closure_invoke (libgobject-2.0.so.0)
#51 0x00007f8e829fe37d n/a (libgobject-2.0.so.0)
#52 0x00007f8e82a06bcc g_signal_emit_valist (libgobject-2.0.so.0)
#53 0x00007f8e82a06faf g_signal_emit (libgobject-2.0.so.0)
#54 0x00007f8e8321f8a3 clutter_actor_continue_paint (libmutter-clutter-1.0.=
so)
#55 0x00007f8e83225aab n/a (libmutter-clutter-1.0.so)
#56 0x00007f8e85102aa0 n/a (libgnome-shell.so)
#57 0x00007f8e829ebecf g_closure_invoke (libgobject-2.0.so.0)
#58 0x00007f8e829fe37d n/a (libgobject-2.0.so.0)
#59 0x00007f8e82a06bcc g_signal_emit_valist (libgobject-2.0.so.0)
#60 0x00007f8e82a06faf g_signal_emit (libgobject-2.0.so.0)
#61 0x00007f8e8321f8a3 clutter_actor_continue_paint (libmutter-clutter-1.0.=
so)
#62 0x00007f8e83225aab n/a (libmutter-clutter-1.0.so)
#63 0x00007f8e8327847a n/a (libmutter-clutter-1.0.so)

Stack trace of thread 23196:
#0  0x00007f8e821ed48d poll (libc.so.6)
#1  0x00007f8e82713786 n/a (libglib-2.0.so.0)
#2  0x00007f8e8271389c g_main_context_iteration (libglib-2.0.so.0)
#3  0x00007f8e64ecc4bd n/a (libdconfsettings.so)
#4  0x00007f8e8273b0d5 n/a (libglib-2.0.so.0)
#5  0x00007f8e824b3454 start_thread (libpthread.so.0)
#6  0x00007f8e821f67df __clone (libc.so.6)

Stack trace of thread 23189:
#0  0x00007f8e821ed48d poll (libc.so.6)
#1  0x00007f8e82713786 n/a (libglib-2.0.so.0)
#2  0x00007f8e8271389c g_main_context_iteration (libglib-2.0.so.0)
#3  0x00007f8e827138e1 n/a (libglib-2.0.so.0)
#4  0x00007f8e8273b0d5 n/a (libglib-2.0.so.0)
#5  0x00007f8e824b3454 start_thread (libpthread.so.0)
#6  0x00007f8e821f67df __clone (libc.so.6)

Stack trace of thread 23199:
#0  0x00007f8e821ed48d poll (libc.so.6)
#1  0x00007f8e7e557ee1 n/a (libpulse.so.0)
#2  0x00007f8e7e5496f1 pa_mainloop_poll (libpulse.so.0)
#3  0x00007f8e7e549d8e pa_mainloop_iterate (libpulse.so.0)
#4  0x00007f8e7e549e40 pa_mainloop_run (libpulse.so.0)
#5  0x00007f8e7e557e29 n/a (libpulse.so.0)
#6  0x00007f8e73cbdfe8 n/a (libpulsecommon-9.99.so)
#7  0x00007f8e824b3454 start_thread (libpthread.so.0)
#8  0x00007f8e821f67df __clone (libc.so.6)

Stack trace of thread 23200:
#0  0x00007f8e824b910f pthread_cond_wait@@GLIBC_2.3.2 (libpthread.so.0)
#1  0x00007f8e753ee4e0 PR_WaitCondVar (libnspr4.so)
#2  0x00007f8e7dfadc0e n/a (libmozjs-24.so)
#3  0x00007f8e753f3d6c n/a (libnspr4.so)
#4  0x00007f8e824b3454 start_thread (libpthread.so.0)
#5  0x00007f8e821f67df __clone (libc.so.6)

Stack trace of thread 23194:
#0  0x00007f8e821f1f19 syscall (libc.so.6)
#1  0x00007f8e8275903a g_cond_wait_until (libglib-2.0.so.0)
#2  0x00007f8e826e7e89 n/a (libglib-2.0.so.0)
#3  0x00007f8e826e84ac g_async_queue_timeout_pop (libglib-2.0.so.0)
#4  0x00007f8e8273bb9d n/a (libglib-2.0.so.0)
#5  0x00007f8e8273b0d5 n/a (libglib-2.0.so.0)
#6  0x00007f8e824b3454 start_thread (libpthread.so.0)
#7  0x00007f8e821f67df __clone (libc.so.6)

Stack trace of thread 23190:
#0  0x00007f8e821ed48d poll (libc.so.6)
#1  0x00007f8e82713786 n/a (libglib-2.0.so.0)
#2  0x00007f8e82713b12 g_main_loop_run (libglib-2.0.so.0)
#3  0x00007f8e82cf9316 n/a (libgio-2.0.so.0)
#4  0x00007f8e8273b0d5 n/a (libglib-2.0.so.0)
#5  0x00007f8e824b3454 start_thread (libpthread.so.0)
#6  0x00007f8e821f67df __clone (libc.so.6)

Stack trace of thread 23201:
#0  0x00007f8e824b910f pthread_cond_wait@@GLIBC_2.3.2 (libpthread.so.0)
#1  0x00007f8e753ee4e0 PR_WaitCondVar (libnspr4.so)
#2  0x00007f8e7e021bab n/a (libmozjs-24.so)
#3  0x00007f8e753f3d6c n/a (libnspr4.so)
#4  0x00007f8e824b3454 start_thread (libpthread.so.0)
#5  0x00007f8e821f67df __clone (libc.so.6)

Thanks again!
Tony

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--14848001440.0De5e05EA.3215
Date: Thu, 19 Jan 2017 04:29:04 +0000
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
   title=3D"NEW - Crash in nouveau_dri.so when switching apps with alt-tab =
in Gnome"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99396#c4">Comment=
 # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Crash in nouveau_dri.so when switching apps with alt-tab =
in Gnome"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D99396">bug 99396<=
/a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
afn2&#64;cornell.edu" title=3D"afn2&#64;cornell.edu">afn2&#64;cornell.edu</=
a>
</span></b>
        <pre>Thanks for the reply, Ilia. The video card is a GeForce 750M (=
GK107) in a
mid-2014 MacBook Pro Retina.

I rebuilt the library without stripping symbols and then reproduced the cra=
sh.
Here's an updated stack trace. Luckily it doesn't appear that there are
multiple threads doing GL work:

Jan 18 23:22:24 mbp systemd-coredump[23240]: Process 23187 (gnome-shell) of
user 1000 dumped core.

Stack trace of thread 23187:
#0  0x00007f8e82236793 __memmove_avx_unaligned_erms (libc.so.6)
#1  0x00007f8e6eb59160 nouveau_scratch_data (nouveau_dri.so)
#2  0x00007f8e6ec65b58 nvc0_update_user_vbufs_shared (nouveau_dri.so)
#3  0x00007f8e6ec5aea5 nvc0_state_validate (nouveau_dri.so)
#4  0x00007f8e6ec5b087 nvc0_state_validate_3d (nouveau_dri.so)
#5  0x00007f8e6ec66f14 nvc0_draw_vbo (nouveau_dri.so)
#6  0x00007f8e6e9bfe12 cso_draw_arrays (nouveau_dri.so)
#7  0x00007f8e6e8773d0 st_pbo_draw (nouveau_dri.so)
#8  0x00007f8e6e82e897 try_pbo_upload_common (nouveau_dri.so)
#9  0x00007f8e6e833f95 st_TexSubImage (nouveau_dri.so)
#10 0x00007f8e6e834de0 st_TexImage (nouveau_dri.so)
#11 0x00007f8e6e7b8f47 teximage (nouveau_dri.so)
#12 0x00007f8e6e7b9d40 _mesa_TexImage2D (nouveau_dri.so)
#13 0x00007f8e7fba94ed n/a (libmutter-cogl.so)
#14 0x00007f8e7fb9ab14 n/a (libmutter-cogl.so)
#15 0x00007f8e7fbcfe56 cogl_texture_allocate (libmutter-cogl.so)
#16 0x00007f8e7fbeb40b n/a (libmutter-cogl.so)
#17 0x00007f8e7fbeb909 cogl_texture_new_from_bitmap (libmutter-cogl.so)
#18 0x00007f8e83243143 n/a (libmutter-clutter-1.0.so)
#19 0x00007f8e8321f85d clutter_actor_continue_paint (libmutter-clutter-1.0.=
so)
#20 0x00007f8e83225aab n/a (libmutter-clutter-1.0.so)
#21 0x00007f8e85102aa0 n/a (libgnome-shell.so)
#22 0x00007f8e829ebecf g_closure_invoke (libgobject-2.0.so.0)
#23 0x00007f8e829fe37d n/a (libgobject-2.0.so.0)
#24 0x00007f8e82a06bcc g_signal_emit_valist (libgobject-2.0.so.0)
#25 0x00007f8e82a06faf g_signal_emit (libgobject-2.0.so.0)
#26 0x00007f8e8321f8a3 clutter_actor_continue_paint (libmutter-clutter-1.0.=
so)
#27 0x00007f8e83225aab n/a (libmutter-clutter-1.0.so)
#28 0x00007f8e8510cf90 n/a (libgnome-shell.so)
#29 0x00007f8e829ebecf g_closure_invoke (libgobject-2.0.so.0)
#30 0x00007f8e829fe37d n/a (libgobject-2.0.so.0)
#31 0x00007f8e82a06bcc g_signal_emit_valist (libgobject-2.0.so.0)
#32 0x00007f8e82a06faf g_signal_emit (libgobject-2.0.so.0)
#33 0x00007f8e8321f8a3 clutter_actor_continue_paint (libmutter-clutter-1.0.=
so)
#34 0x00007f8e83225aab n/a (libmutter-clutter-1.0.so)
#35 0x00007f8e8511b182 n/a (libgnome-shell.so)
#36 0x00007f8e829ebecf g_closure_invoke (libgobject-2.0.so.0)
#37 0x00007f8e829fe37d n/a (libgobject-2.0.so.0)
#38 0x00007f8e82a06bcc g_signal_emit_valist (libgobject-2.0.so.0)
#39 0x00007f8e82a06faf g_signal_emit (libgobject-2.0.so.0)
#40 0x00007f8e8321f8a3 clutter_actor_continue_paint (libmutter-clutter-1.0.=
so)
#41 0x00007f8e83225706 n/a (libmutter-clutter-1.0.so)
#42 0x00007f8e85102aa0 n/a (libgnome-shell.so)
#43 0x00007f8e829ebecf g_closure_invoke (libgobject-2.0.so.0)
#44 0x00007f8e829fe37d n/a (libgobject-2.0.so.0)
#45 0x00007f8e82a06bcc g_signal_emit_valist (libgobject-2.0.so.0)
#46 0x00007f8e82a06faf g_signal_emit (libgobject-2.0.so.0)
#47 0x00007f8e8321f8a3 clutter_actor_continue_paint (libmutter-clutter-1.0.=
so)
#48 0x00007f8e83225aab n/a (libmutter-clutter-1.0.so)
#49 0x00007f8e85102aa0 n/a (libgnome-shell.so)
#50 0x00007f8e829ebecf g_closure_invoke (libgobject-2.0.so.0)
#51 0x00007f8e829fe37d n/a (libgobject-2.0.so.0)
#52 0x00007f8e82a06bcc g_signal_emit_valist (libgobject-2.0.so.0)
#53 0x00007f8e82a06faf g_signal_emit (libgobject-2.0.so.0)
#54 0x00007f8e8321f8a3 clutter_actor_continue_paint (libmutter-clutter-1.0.=
so)
#55 0x00007f8e83225aab n/a (libmutter-clutter-1.0.so)
#56 0x00007f8e85102aa0 n/a (libgnome-shell.so)
#57 0x00007f8e829ebecf g_closure_invoke (libgobject-2.0.so.0)
#58 0x00007f8e829fe37d n/a (libgobject-2.0.so.0)
#59 0x00007f8e82a06bcc g_signal_emit_valist (libgobject-2.0.so.0)
#60 0x00007f8e82a06faf g_signal_emit (libgobject-2.0.so.0)
#61 0x00007f8e8321f8a3 clutter_actor_continue_paint (libmutter-clutter-1.0.=
so)
#62 0x00007f8e83225aab n/a (libmutter-clutter-1.0.so)
#63 0x00007f8e8327847a n/a (libmutter-clutter-1.0.so)

Stack trace of thread 23196:
#0  0x00007f8e821ed48d poll (libc.so.6)
#1  0x00007f8e82713786 n/a (libglib-2.0.so.0)
#2  0x00007f8e8271389c g_main_context_iteration (libglib-2.0.so.0)
#3  0x00007f8e64ecc4bd n/a (libdconfsettings.so)
#4  0x00007f8e8273b0d5 n/a (libglib-2.0.so.0)
#5  0x00007f8e824b3454 start_thread (libpthread.so.0)
#6  0x00007f8e821f67df __clone (libc.so.6)

Stack trace of thread 23189:
#0  0x00007f8e821ed48d poll (libc.so.6)
#1  0x00007f8e82713786 n/a (libglib-2.0.so.0)
#2  0x00007f8e8271389c g_main_context_iteration (libglib-2.0.so.0)
#3  0x00007f8e827138e1 n/a (libglib-2.0.so.0)
#4  0x00007f8e8273b0d5 n/a (libglib-2.0.so.0)
#5  0x00007f8e824b3454 start_thread (libpthread.so.0)
#6  0x00007f8e821f67df __clone (libc.so.6)

Stack trace of thread 23199:
#0  0x00007f8e821ed48d poll (libc.so.6)
#1  0x00007f8e7e557ee1 n/a (libpulse.so.0)
#2  0x00007f8e7e5496f1 pa_mainloop_poll (libpulse.so.0)
#3  0x00007f8e7e549d8e pa_mainloop_iterate (libpulse.so.0)
#4  0x00007f8e7e549e40 pa_mainloop_run (libpulse.so.0)
#5  0x00007f8e7e557e29 n/a (libpulse.so.0)
#6  0x00007f8e73cbdfe8 n/a (libpulsecommon-9.99.so)
#7  0x00007f8e824b3454 start_thread (libpthread.so.0)
#8  0x00007f8e821f67df __clone (libc.so.6)

Stack trace of thread 23200:
#0  0x00007f8e824b910f pthread_cond_wait&#64;&#64;GLIBC_2.3.2 (libpthread.s=
o.0)
#1  0x00007f8e753ee4e0 PR_WaitCondVar (libnspr4.so)
#2  0x00007f8e7dfadc0e n/a (libmozjs-24.so)
#3  0x00007f8e753f3d6c n/a (libnspr4.so)
#4  0x00007f8e824b3454 start_thread (libpthread.so.0)
#5  0x00007f8e821f67df __clone (libc.so.6)

Stack trace of thread 23194:
#0  0x00007f8e821f1f19 syscall (libc.so.6)
#1  0x00007f8e8275903a g_cond_wait_until (libglib-2.0.so.0)
#2  0x00007f8e826e7e89 n/a (libglib-2.0.so.0)
#3  0x00007f8e826e84ac g_async_queue_timeout_pop (libglib-2.0.so.0)
#4  0x00007f8e8273bb9d n/a (libglib-2.0.so.0)
#5  0x00007f8e8273b0d5 n/a (libglib-2.0.so.0)
#6  0x00007f8e824b3454 start_thread (libpthread.so.0)
#7  0x00007f8e821f67df __clone (libc.so.6)

Stack trace of thread 23190:
#0  0x00007f8e821ed48d poll (libc.so.6)
#1  0x00007f8e82713786 n/a (libglib-2.0.so.0)
#2  0x00007f8e82713b12 g_main_loop_run (libglib-2.0.so.0)
#3  0x00007f8e82cf9316 n/a (libgio-2.0.so.0)
#4  0x00007f8e8273b0d5 n/a (libglib-2.0.so.0)
#5  0x00007f8e824b3454 start_thread (libpthread.so.0)
#6  0x00007f8e821f67df __clone (libc.so.6)

Stack trace of thread 23201:
#0  0x00007f8e824b910f pthread_cond_wait&#64;&#64;GLIBC_2.3.2 (libpthread.s=
o.0)
#1  0x00007f8e753ee4e0 PR_WaitCondVar (libnspr4.so)
#2  0x00007f8e7e021bab n/a (libmozjs-24.so)
#3  0x00007f8e753f3d6c n/a (libnspr4.so)
#4  0x00007f8e824b3454 start_thread (libpthread.so.0)
#5  0x00007f8e821f67df __clone (libc.so.6)

Thanks again!
Tony</pre>
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

--14848001440.0De5e05EA.3215--

--===============0302233703==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0302233703==--
