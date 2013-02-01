From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 60007] BUG: nouveau crashes in various ways in
 32-bits Fedora 18
Date: Fri, 01 Feb 2013 20:52:33 +0000
Message-ID: <bug-60007-8800-1b4EFlIaTV@http.bugs.freedesktop.org/>
References: <bug-60007-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1595550877=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-60007-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1595550877==
Content-Type: multipart/alternative; boundary="1359751953.575D1.27447"; charset="us-ascii"


--1359751953.575D1.27447
Date: Fri, 1 Feb 2013 20:52:33 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=60007

--- Comment #7 from Cornel Panceac <cpanceac-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
with 3.7 kernel, patched or unpatched, it doesn't matter, on nvidia 6150, the
screen becomes full of garbage (displayed in an order not easy to describe),
and the system freezes.

Steps to reporduce: open pidgin, enter yahoo account, select "Open inbox" from
"Accounts".

This does not happen on 3.6 kernel.

in /var/log/messages, if i boot with 3.6 kernel i see: 

Feb  2 00:39:47 logalhost kernel: [    1.076939] [drm] nouveau 0000:00:0d.0:
======= misaligned reg 0x0060081D =======

The kernel that does work:

# uname -a
Linux logalhost.logaldomain 3.6.11-5.fc17.i686.PAE #1 SMP Tue Jan 8 21:49:19
UTC 2013 i686 i686 i386 GNU/Linux

# lspci -nn | grep VGA
00:0d.0 VGA compatible controller [0300]: nVidia Corporation C61 [GeForce
6150SE nForce 430] [10de:03d0] (rev a2)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1359751953.575D1.27447
Date: Fri, 1 Feb 2013 20:52:33 +0000
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
   title="NEW --- - BUG: nouveau crashes in various ways in 32-bits Fedora 18"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60007#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - BUG: nouveau crashes in various ways in 32-bits Fedora 18"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=60007">bug 60007</a>
              from <span class="vcard"><a class="email" href="mailto:cpanceac&#64;gmail.com" title="Cornel Panceac &lt;cpanceac&#64;gmail.com&gt;"> <span class="fn">Cornel Panceac</span></a>
</span></b>
        <pre>with 3.7 kernel, patched or unpatched, it doesn't matter, on nvidia 6150, the
screen becomes full of garbage (displayed in an order not easy to describe),
and the system freezes.

Steps to reporduce: open pidgin, enter yahoo account, select &quot;Open inbox&quot; from
&quot;Accounts&quot;.

This does not happen on 3.6 kernel.

in /var/log/messages, if i boot with 3.6 kernel i see: 

Feb  2 00:39:47 logalhost kernel: [    1.076939] [drm] nouveau 0000:00:0d.0:
======= misaligned reg 0x0060081D =======

The kernel that does work:

# uname -a
Linux logalhost.logaldomain 3.6.11-5.fc17.i686.PAE #1 SMP Tue Jan 8 21:49:19
UTC 2013 i686 i686 i386 GNU/Linux

# lspci -nn | grep VGA
00:0d.0 VGA compatible controller [0300]: nVidia Corporation C61 [GeForce
6150SE nForce 430] [10de:03d0] (rev a2)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1359751953.575D1.27447--

--===============1595550877==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1595550877==--
