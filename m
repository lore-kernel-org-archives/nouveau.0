From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77361] [nve7] nouveau not working on 3.13 linux
	kernel
Date: Sun, 13 Apr 2014 00:54:08 +0000
Message-ID: <bug-77361-8800-DcdLKTfmag@http.bugs.freedesktop.org/>
References: <bug-77361-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1539791259=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-77361-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1539791259==
Content-Type: multipart/alternative; boundary="1397350447.138b5B1.11582"; charset="us-ascii"


--1397350447.138b5B1.11582
Date: Sun, 13 Apr 2014 00:54:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77361

--- Comment #13 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Taking a closer look, it's almost impossible that the kernel is to blame here
(esp considering the dmesg you've provided).

The message "No devices detected" comes from the server whenever no screen are
created (xf86NumScreens == 0). The latter is incremented when the
xf86AllocateScreen(drv, flags ~XF86_ALLOCATE_GPU_SCREEN) helper is called,
which is executed by the driver depending on the path chosen in
xf86platformProbeDev().

Long story short, drop the xorg.conf, and double check what exactly did you
update when the issue occurred. The Xorg.log you've attached here differs from
the one in the debian forum, so I'm guessing something else got updated
silently and you may have missed it.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1397350447.138b5B1.11582
Date: Sun, 13 Apr 2014 00:54:07 +0000
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
   title="NEW --- - [nve7] nouveau not working on 3.13 linux kernel"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77361#c13">Comment # 13</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [nve7] nouveau not working on 3.13 linux kernel"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77361">bug 77361</a>
              from <span class="vcard"><a class="email" href="mailto:emil.l.velikov&#64;gmail.com" title="Emil Velikov &lt;emil.l.velikov&#64;gmail.com&gt;"> <span class="fn">Emil Velikov</span></a>
</span></b>
        <pre>Taking a closer look, it's almost impossible that the kernel is to blame here
(esp considering the dmesg you've provided).

The message &quot;No devices detected&quot; comes from the server whenever no screen are
created (xf86NumScreens == 0). The latter is incremented when the
xf86AllocateScreen(drv, flags ~XF86_ALLOCATE_GPU_SCREEN) helper is called,
which is executed by the driver depending on the path chosen in
xf86platformProbeDev().

Long story short, drop the xorg.conf, and double check what exactly did you
update when the issue occurred. The Xorg.log you've attached here differs from
the one in the debian forum, so I'm guessing something else got updated
silently and you may have missed it.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1397350447.138b5B1.11582--

--===============1539791259==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1539791259==--
