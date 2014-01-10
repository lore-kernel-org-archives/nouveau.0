From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73358] [regression?][nv34] adobe flash + firefox ->
	DATA_ERROR
Date: Fri, 10 Jan 2014 10:19:24 +0000
Message-ID: <bug-73358-8800-50itgRtmEn@http.bugs.freedesktop.org/>
References: <bug-73358-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0522149247=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-73358-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0522149247==
Content-Type: multipart/alternative; boundary="1389349164.dA3355E1.28111"; charset="us-ascii"


--1389349164.dA3355E1.28111
Date: Fri, 10 Jan 2014 10:19:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73358

--- Comment #5 from Ronald <ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Yeah, the entire screen stalls. If I kill the tab playing adobe flash,
everything is fine again. Switching tty does not work. Xorg disappears, but I
only see the contents of tty1 on any other tty just before Xorg was started. I
did not have these errors before when using Ubuntu. Not in this form. They
appeared sporadically but everything was fine afterwards.

Some more critical information. The first time after installation, everything
worked fine.

I looked at the upgrade logs:

[2014-01-07 16:14] [PACKAGEKIT] upgraded xorg-server-common (1.14.5-1 ->
1.14.5-2)
[2014-01-07 16:14] [PACKAGEKIT] upgraded xorg-server (1.14.5-1 -> 1.14.5-2)
[2014-01-09 09:19] [PACKAGEKIT] upgraded glibc (2.18-11 -> 2.18-12)
[2014-01-09 09:19] [PACKAGEKIT] upgraded libdrm (2.4.50-1 -> 2.4.51-1)

It's not the kernel, I just tried v3.13-rc3.

Libdrm is not a huge upgrade and no nouveau files were touched.

The xorg-server bump was about this:
https://projects.archlinux.org/svntogit/packages.git/commit/trunk?h=packages/xorg-server&id=7943d976eef97d4d75026b6f2c3936b03aeb4648

I think I got lucky the first time it all worked. I guess.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389349164.dA3355E1.28111
Date: Fri, 10 Jan 2014 10:19:24 +0000
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
   title="NEW --- - [regression?][nv34] adobe flash + firefox -&gt; DATA_ERROR"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73358#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [regression?][nv34] adobe flash + firefox -&gt; DATA_ERROR"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73358">bug 73358</a>
              from <span class="vcard"><a class="email" href="mailto:ronald645&#64;gmail.com" title="Ronald &lt;ronald645&#64;gmail.com&gt;"> <span class="fn">Ronald</span></a>
</span></b>
        <pre>Yeah, the entire screen stalls. If I kill the tab playing adobe flash,
everything is fine again. Switching tty does not work. Xorg disappears, but I
only see the contents of tty1 on any other tty just before Xorg was started. I
did not have these errors before when using Ubuntu. Not in this form. They
appeared sporadically but everything was fine afterwards.

Some more critical information. The first time after installation, everything
worked fine.

I looked at the upgrade logs:

[2014-01-07 16:14] [PACKAGEKIT] upgraded xorg-server-common (1.14.5-1 -&gt;
1.14.5-2)
[2014-01-07 16:14] [PACKAGEKIT] upgraded xorg-server (1.14.5-1 -&gt; 1.14.5-2)
[2014-01-09 09:19] [PACKAGEKIT] upgraded glibc (2.18-11 -&gt; 2.18-12)
[2014-01-09 09:19] [PACKAGEKIT] upgraded libdrm (2.4.50-1 -&gt; 2.4.51-1)

It's not the kernel, I just tried v3.13-rc3.

Libdrm is not a huge upgrade and no nouveau files were touched.

The xorg-server bump was about this:
<a href="https://projects.archlinux.org/svntogit/packages.git/commit/trunk?h=packages/xorg-server&amp;id=7943d976eef97d4d75026b6f2c3936b03aeb4648">https://projects.archlinux.org/svntogit/packages.git/commit/trunk?h=packages/xorg-server&amp;id=7943d976eef97d4d75026b6f2c3936b03aeb4648</a>

I think I got lucky the first time it all worked. I guess.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389349164.dA3355E1.28111--

--===============0522149247==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0522149247==--
