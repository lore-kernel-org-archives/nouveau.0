From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67051] No nouveau HDMI sound on NVIDIA GT430
Date: Wed, 24 Jul 2013 02:32:50 +0000
Message-ID: <bug-67051-8800-IAY7QIpIOd@http.bugs.freedesktop.org/>
References: <bug-67051-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0569849976=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-67051-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0569849976==
Content-Type: multipart/alternative; boundary="1374633169.eF6f0.32084"; charset="us-ascii"


--1374633169.eF6f0.32084
Date: Wed, 24 Jul 2013 02:32:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67051

--- Comment #83 from Alex <alupu01-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi Ilia,

It's a little late for me;  I'm just playing for the time being to get in shape
for tomorrow:
Please help me with this (I had already applied successfully, per your
instructions, the hdmi-1.patch + hdminva3.patch + hdminva3-4.patch,
but I'm stumbling at this step:

# In an attempt to restore (after it failed originally)
[~/linux]$ git checkout drivers/gpu/drm/nouveau ; echo $?
0

[~/linux]$ patch -p1 < /home/alex/debug-3.patch ; echo $?
patching file drivers/gpu/drm/nouveau/core/engine/disp/hdminva3.c
patching file drivers/gpu/drm/nouveau/core/engine/disp/sornv50.c
Hunk #2 succeeded at 77 with fuzz 1.
patching file drivers/gpu/drm/nouveau/nv50_display.c
Hunk #1 FAILED at 1657.
Hunk #2 FAILED at 1666.
2 out of 2 hunks FAILED -- saving rejects to file
drivers/gpu/drm/nouveau/nv50_display.c.rej
1

Thanks,
-- Alex

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1374633169.eF6f0.32084
Date: Wed, 24 Jul 2013 02:32:49 +0000
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
   title="NEW --- - No nouveau HDMI sound on NVIDIA GT430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051#c83">Comment # 83</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - No nouveau HDMI sound on NVIDIA GT430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051">bug 67051</a>
              from <span class="vcard"><a class="email" href="mailto:alupu01&#64;gmail.com" title="Alex &lt;alupu01&#64;gmail.com&gt;"> <span class="fn">Alex</span></a>
</span></b>
        <pre>Hi Ilia,

It's a little late for me;  I'm just playing for the time being to get in shape
for tomorrow:
Please help me with this (I had already applied successfully, per your
instructions, the hdmi-1.patch + hdminva3.patch + hdminva3-4.patch,
but I'm stumbling at this step:

# In an attempt to restore (after it failed originally)
[~/linux]$ git checkout drivers/gpu/drm/nouveau ; echo $?
0

[~/linux]$ patch -p1 &lt; /home/alex/debug-3.patch ; echo $?
patching file drivers/gpu/drm/nouveau/core/engine/disp/hdminva3.c
patching file drivers/gpu/drm/nouveau/core/engine/disp/sornv50.c
Hunk #2 succeeded at 77 with fuzz 1.
patching file drivers/gpu/drm/nouveau/nv50_display.c
Hunk #1 FAILED at 1657.
Hunk #2 FAILED at 1666.
2 out of 2 hunks FAILED -- saving rejects to file
drivers/gpu/drm/nouveau/nv50_display.c.rej
1

Thanks,
-- Alex</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1374633169.eF6f0.32084--

--===============0569849976==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0569849976==--
