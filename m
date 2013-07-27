From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67051] No nouveau HDMI sound on NVIDIA GT430
Date: Sat, 27 Jul 2013 22:14:35 +0000
Message-ID: <bug-67051-8800-qoqCD9gKZt@http.bugs.freedesktop.org/>
References: <bug-67051-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1953457164=="
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


--===============1953457164==
Content-Type: multipart/alternative; boundary="1374963275.abeBea50.22894"; charset="us-ascii"


--1374963275.abeBea50.22894
Date: Sat, 27 Jul 2013 22:14:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67051

--- Comment #93 from Alex <alupu01-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 83105
  --> https://bugs.freedesktop.org/attachment.cgi?id=83105&action=edit
3.10.1 DMESG

I used 3.10.1:
 it is mutually acceptable and
 is the kernel of this bug submission.

For the record:
[/linux-3.10.1]$ patch -p1 < /home/alex/debug-3.patch ; echo $?
patching file drivers/gpu/drm/nouveau/core/engine/disp/hdminva3.c
patching file drivers/gpu/drm/nouveau/core/engine/disp/sornv50.c
patching file drivers/gpu/drm/nouveau/nv50_display.c
0

NOUVEAU_DEBUG is at its default value: 5

NO "nouveau.debug=PDISP=spam"

FWIW, no HDMI sound.

cat /proc/asound/card1/eld#3.0
monitor_present         1
eld_valid               0

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1374963275.abeBea50.22894
Date: Sat, 27 Jul 2013 22:14:35 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051#c93">Comment # 93</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - No nouveau HDMI sound on NVIDIA GT430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051">bug 67051</a>
              from <span class="vcard"><a class="email" href="mailto:alupu01&#64;gmail.com" title="Alex &lt;alupu01&#64;gmail.com&gt;"> <span class="fn">Alex</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=83105" name="attach_83105" title="3.10.1 DMESG">attachment 83105</a> <a href="attachment.cgi?id=83105&amp;action=edit" title="3.10.1 DMESG">[details]</a></span>
3.10.1 DMESG

I used 3.10.1:
 it is mutually acceptable and
 is the kernel of this bug submission.

For the record:
[/linux-3.10.1]$ patch -p1 &lt; /home/alex/debug-3.patch ; echo $?
patching file drivers/gpu/drm/nouveau/core/engine/disp/hdminva3.c
patching file drivers/gpu/drm/nouveau/core/engine/disp/sornv50.c
patching file drivers/gpu/drm/nouveau/nv50_display.c
0

NOUVEAU_DEBUG is at its default value: 5

NO &quot;nouveau.debug=PDISP=spam&quot;

FWIW, no HDMI sound.

cat /proc/asound/card1/eld#3.0
monitor_present         1
eld_valid               0</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1374963275.abeBea50.22894--

--===============1953457164==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1953457164==--
