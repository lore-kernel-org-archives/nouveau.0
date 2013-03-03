From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 61731] Nouveau not working on second monitor
Date: Sun, 03 Mar 2013 12:34:43 +0000
Message-ID: <bug-61731-8800-2Mw4mBNna9@http.bugs.freedesktop.org/>
References: <bug-61731-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0486225284=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-61731-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0486225284==
Content-Type: multipart/alternative; boundary="1362314083.B5ECdaf1.21450"; charset="us-ascii"


--1362314083.B5ECdaf1.21450
Date: Sun, 3 Mar 2013 12:34:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=61731

--- Comment #5 from Ronald <rvhbox-freedesktop-/E1597aS9LQAvxtiuMwx3w@public.gmane.org> ---
Well, it seemed that the first reboot was just sheer luck. After several more
reboot the seem probleem seems to exist. I unstall nvidia-current now. 

But dmesg now reports: 

[   44.306497] nouveau 0000:01:00.0: enabling device (0000 -> 0003)
[   44.306965] [drm] nouveau 0000:01:00.0: unsupported chipset 0xffffffff
[   44.307214] nouveau: probe of 0000:01:00.0 failed with error -22

See logs for more details,

mesa-libgl seems to be installed:

||/ Name                     Version           Architecture      Description
+++-========================-=================-=================-=====================================================
ii  libgl1-mesa-dri:i386     9.0.2-0ubuntu0.1  i386              free
implementation of the OpenGL API -- DRI modules
un  libgl1-mesa-dri-experime <none>                              (no
description available)
ii  libgl1-mesa-glx:i386     9.0.2-0ubuntu0.1  i386              free
implementation of the OpenGL API -- GLX runtime
un  libgl1-mesa-glx-no-multi <none>                              (no
description available)
ii  libglapi-mesa:i386       9.0.2-0ubuntu0.1  i386              free
implementation of the GL API -- shared library
ii  libglu1-mesa:i386        9.0.0-0ubuntu1    i386              Mesa OpenGL
utility library (GLU)
ii  mesa-utils               8.0.1+git20110129 i386              Miscellaneous
Mesa GL utilities
un  mesag3                   <none>                              (no
description available)
un  xlibmesa-dri             <none>                              (no
description available)
un  xlibmesa3                <none>                              (no
description available)


I hope to hear.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1362314083.B5ECdaf1.21450
Date: Sun, 3 Mar 2013 12:34:43 +0000
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
   title="NEW --- - Nouveau not working on second monitor"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61731#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Nouveau not working on second monitor"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61731">bug 61731</a>
              from <span class="vcard"><a class="email" href="mailto:rvhbox-freedesktop&#64;yahoo.com" title="Ronald &lt;rvhbox-freedesktop&#64;yahoo.com&gt;"> <span class="fn">Ronald</span></a>
</span></b>
        <pre>Well, it seemed that the first reboot was just sheer luck. After several more
reboot the seem probleem seems to exist. I unstall nvidia-current now. 

But dmesg now reports: 

[   44.306497] nouveau 0000:01:00.0: enabling device (0000 -&gt; 0003)
[   44.306965] [drm] nouveau 0000:01:00.0: unsupported chipset 0xffffffff
[   44.307214] nouveau: probe of 0000:01:00.0 failed with error -22

See logs for more details,

mesa-libgl seems to be installed:

||/ Name                     Version           Architecture      Description
+++-========================-=================-=================-=====================================================
ii  libgl1-mesa-dri:i386     9.0.2-0ubuntu0.1  i386              free
implementation of the OpenGL API -- DRI modules
un  libgl1-mesa-dri-experime &lt;none&gt;                              (no
description available)
ii  libgl1-mesa-glx:i386     9.0.2-0ubuntu0.1  i386              free
implementation of the OpenGL API -- GLX runtime
un  libgl1-mesa-glx-no-multi &lt;none&gt;                              (no
description available)
ii  libglapi-mesa:i386       9.0.2-0ubuntu0.1  i386              free
implementation of the GL API -- shared library
ii  libglu1-mesa:i386        9.0.0-0ubuntu1    i386              Mesa OpenGL
utility library (GLU)
ii  mesa-utils               8.0.1+git20110129 i386              Miscellaneous
Mesa GL utilities
un  mesag3                   &lt;none&gt;                              (no
description available)
un  xlibmesa-dri             &lt;none&gt;                              (no
description available)
un  xlibmesa3                &lt;none&gt;                              (no
description available)


I hope to hear.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1362314083.B5ECdaf1.21450--

--===============0486225284==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0486225284==--
