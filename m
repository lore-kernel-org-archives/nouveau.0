From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70208] Nouveau driver doesn't find vbios for Geforce
 GT 750M on Asus N750JV laptop
Date: Mon, 07 Oct 2013 10:41:28 +0000
Message-ID: <bug-70208-8800-N5NzdFSy0C@http.bugs.freedesktop.org/>
References: <bug-70208-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0717396754=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70208-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0717396754==
Content-Type: multipart/alternative; boundary="1381142488.ec2cd1.29971"; charset="us-ascii"


--1381142488.ec2cd1.29971
Date: Mon, 7 Oct 2013 10:41:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70208

--- Comment #15 from 4712.joey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org ---
Spoken too soon :-)

By accident I also "fixed" my haswell's internal intel DRI and so the system is
now running much faster than before, but still powered by the intel's
rendering.

I'm surprised how fast the build in haswell's intel rendering is already :-)


But for the nouveau: It fails to initialise the acceleration, as far as I can
see.

The /var/log/Xorg.0.log shows: (i will attach the full log)

[    75.892] (II) NOUVEAU(G0): Opened GPU channel 0
[    77.893] (EE) NOUVEAU(G0): Failed to initialise context object: 2D_NVC0 (0)
[    77.893] (EE) NOUVEAU(G0): Error initialising acceleration.  Falling back
to NoAccel
[    77.893] (==) NOUVEAU(G0): Backing store disabled
[    77.893] (==) NOUVEAU(G0): Silken mouse enabled
[    77.893] (==) NOUVEAU(G0): DPMS enabled
[    77.893] (II) NOUVEAU(G0): RandR 1.2 enabled, ignore the following RandR
disabled message.


And so "DRI_PRIME=1 glxinfo | grep OpenGL" shows that it is running on intel
only:

OpenGL vendor string: Intel Open Source Technology Center
OpenGL renderer string: Mesa DRI Intel(R) Haswell Mobile 
OpenGL core profile version string: 3.1 (Core Profile) Mesa 9.2.0
OpenGL core profile shading language version string: 1.40
OpenGL core profile context flags: (none)
OpenGL core profile extensions:
OpenGL version string: 3.0 Mesa 9.2.0
OpenGL shading language version string: 1.30
OpenGL context flags: (none)
OpenGL extensions:

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1381142488.ec2cd1.29971
Date: Mon, 7 Oct 2013 10:41:28 +0000
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
   title="NEW --- - Nouveau driver doesn't find vbios for Geforce GT 750M on Asus N750JV laptop"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70208#c15">Comment # 15</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Nouveau driver doesn't find vbios for Geforce GT 750M on Asus N750JV laptop"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70208">bug 70208</a>
              from <span class="vcard"><a class="email" href="mailto:4712.joey&#64;gmail.com" title="4712.joey&#64;gmail.com">4712.joey&#64;gmail.com</a>
</span></b>
        <pre>Spoken too soon :-)

By accident I also &quot;fixed&quot; my haswell's internal intel DRI and so the system is
now running much faster than before, but still powered by the intel's
rendering.

I'm surprised how fast the build in haswell's intel rendering is already :-)


But for the nouveau: It fails to initialise the acceleration, as far as I can
see.

The /var/log/Xorg.0.log shows: (i will attach the full log)

[    75.892] (II) NOUVEAU(G0): Opened GPU channel 0
[    77.893] (EE) NOUVEAU(G0): Failed to initialise context object: 2D_NVC0 (0)
[    77.893] (EE) NOUVEAU(G0): Error initialising acceleration.  Falling back
to NoAccel
[    77.893] (==) NOUVEAU(G0): Backing store disabled
[    77.893] (==) NOUVEAU(G0): Silken mouse enabled
[    77.893] (==) NOUVEAU(G0): DPMS enabled
[    77.893] (II) NOUVEAU(G0): RandR 1.2 enabled, ignore the following RandR
disabled message.


And so &quot;DRI_PRIME=1 glxinfo | grep OpenGL&quot; shows that it is running on intel
only:

OpenGL vendor string: Intel Open Source Technology Center
OpenGL renderer string: Mesa DRI Intel(R) Haswell Mobile 
OpenGL core profile version string: 3.1 (Core Profile) Mesa 9.2.0
OpenGL core profile shading language version string: 1.40
OpenGL core profile context flags: (none)
OpenGL core profile extensions:
OpenGL version string: 3.0 Mesa 9.2.0
OpenGL shading language version string: 1.30
OpenGL context flags: (none)
OpenGL extensions:</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1381142488.ec2cd1.29971--

--===============0717396754==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0717396754==--
