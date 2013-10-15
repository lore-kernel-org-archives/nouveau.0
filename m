From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 69952] [NVAA] Xorg crash+restart after glxgears on
	3.12-rc2
Date: Tue, 15 Oct 2013 17:04:19 +0000
Message-ID: <bug-69952-8800-kY0JzpxI8c@http.bugs.freedesktop.org/>
References: <bug-69952-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2036503192=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-69952-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============2036503192==
Content-Type: multipart/alternative; boundary="1381856658.ADc5CA1.31321"; charset="us-ascii"


--1381856658.ADc5CA1.31321
Date: Tue, 15 Oct 2013 17:04:18 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=69952

--- Comment #1 from dirkneukirchen-S0/GAf8tV78@public.gmane.org ---
mmio traces:

filed in another bug (https://bugs.freedesktop.org/show_bug.cgi?id=69928)
on the same hw:

module load:
https://bugs.freedesktop.org/attachment.cgi?id=87677


simple xinit with sleep:
mmiotrace_xinit.log.xz (3.1 MB)
https://mega.co.nz/#!u4RwFLjK!Yzi4UVujupmRdEIMFZtbQBOtjyoJFR1jrXheO1RUpew

starting glxgears:
mmiotrace_glxgears.log.xz (3.4 MB)
https://mega.co.nz/#!744wlQ7b!CBnbnEYfsIwOuXKFojgy3kuecVkC6U43Bye4nZkKMUk

starting nvidia-settings - since dual screen is active already just browse
through options and then quit:
mmiotrace_dualsettings.log.xz (2.7 MB)
https://mega.co.nz/#!L1ZR3ApZ!XEuYymYmvLyQSQdpwQ0HaiBEipp2CBHz9y3PHNBNn6Q


glxgears posted because: https://bugs.freedesktop.org/show_bug.cgi?id=69952

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1381856658.ADc5CA1.31321
Date: Tue, 15 Oct 2013 17:04:18 +0000
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
   title="NEW --- - [NVAA] Xorg crash+restart after glxgears on 3.12-rc2"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69952#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVAA] Xorg crash+restart after glxgears on 3.12-rc2"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=69952">bug 69952</a>
              from <span class="vcard"><a class="email" href="mailto:dirkneukirchen&#64;web.de" title="dirkneukirchen&#64;web.de">dirkneukirchen&#64;web.de</a>
</span></b>
        <pre>mmio traces:

filed in another bug (<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVAA] Boot of linux kernel 3.12-rc2 hangs"
   href="show_bug.cgi?id=69928">https://bugs.freedesktop.org/show_bug.cgi?id=69928</a>)
on the same hw:

module load:
<a href="https://bugs.freedesktop.org/attachment.cgi?id=87677">https://bugs.freedesktop.org/attachment.cgi?id=87677</a>


simple xinit with sleep:
mmiotrace_xinit.log.xz (3.1 MB)
<a href="https://mega.co.nz/#!u4RwFLjK!Yzi4UVujupmRdEIMFZtbQBOtjyoJFR1jrXheO1RUpew">https://mega.co.nz/#!u4RwFLjK!Yzi4UVujupmRdEIMFZtbQBOtjyoJFR1jrXheO1RUpew</a>

starting glxgears:
mmiotrace_glxgears.log.xz (3.4 MB)
<a href="https://mega.co.nz/#!744wlQ7b!CBnbnEYfsIwOuXKFojgy3kuecVkC6U43Bye4nZkKMUk">https://mega.co.nz/#!744wlQ7b!CBnbnEYfsIwOuXKFojgy3kuecVkC6U43Bye4nZkKMUk</a>

starting nvidia-settings - since dual screen is active already just browse
through options and then quit:
mmiotrace_dualsettings.log.xz (2.7 MB)
<a href="https://mega.co.nz/#!L1ZR3ApZ!XEuYymYmvLyQSQdpwQ0HaiBEipp2CBHz9y3PHNBNn6Q">https://mega.co.nz/#!L1ZR3ApZ!XEuYymYmvLyQSQdpwQ0HaiBEipp2CBHz9y3PHNBNn6Q</a>


glxgears posted because: <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVAA] Xorg crash+restart after glxgears on 3.12-rc2"
   href="show_bug.cgi?id=69952">https://bugs.freedesktop.org/show_bug.cgi?id=69952</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1381856658.ADc5CA1.31321--

--===============2036503192==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2036503192==--
