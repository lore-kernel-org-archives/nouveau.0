From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67051] No nouveau HDMI sound on NVIDIA GT430
Date: Sun, 28 Jul 2013 01:03:14 +0000
Message-ID: <bug-67051-8800-C7Sc4Usgqw@http.bugs.freedesktop.org/>
References: <bug-67051-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1226243734=="
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


--===============1226243734==
Content-Type: multipart/alternative; boundary="1374973393.f86fa8A0.14210"; charset="us-ascii"


--1374973393.f86fa8A0.14210
Date: Sun, 28 Jul 2013 01:03:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67051

--- Comment #96 from Alex <alupu01-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi Ilia,

VERY GOOD NEWS.  PROBLEM SOLVED!!!  TERRIFIC HDMI SOUND.
And that despite my being continuously in your way!

You deserve at least two tickets to Sochi (if still available).

Quote:
The Olympic Games give a powerful boost to the development of television
technology.  The Games in Sochi will be shown entirely in HD format and, in
addition, advanced Ultra High Definition technology will be used in Sochi.

Now if you could somehow procure an NVIDIA card and HDMI cable... (sound
included).
Later, even a monitor and/or television _with_ HDMI input.  True,
they are relatively new, not even six years old...

For the record:
[/linux-3.10.1]$ patch -p1 < /home/alex/hdmi-1.patch ; echo $?
patching file drivers/gpu/drm/nouveau/core/engine/disp/hdanva3.c
0
[/linux-3.10.1]$ patch -p1 < /home/alex/hdminva3.patch ; echo $?
patching file drivers/gpu/drm/nouveau/core/engine/disp/hdminva3.c
0
[/linux-3.10.1]$ patch -p1 < /home/alex/debug-3.patch ; echo $?
patching file drivers/gpu/drm/nouveau/core/engine/disp/hdminva3.c
patching file drivers/gpu/drm/nouveau/core/engine/disp/sornv50.c
patching file drivers/gpu/drm/nouveau/nv50_display.c
0
[/linux-3.10.1]$ patch -p1 < /home/alex/mthd-1.patch ; echo $?
patching file drivers/gpu/drm/nouveau/core/include/core/class.h
0

cat /proc/asound/card1/eld#3.0
monitor_present         1
eld_valid               1
monitor_name            ASUS VE258
connection_type         HDMI
eld_version             [0x2] CEA-861D or below
edid_version            [0x3] CEA-861-B, C or D
manufacture_id          0x6904
product_id              0x25f1
port_id                 0x0
support_hdcp            0
support_ai              0
audio_sync_delay        0
speakers                [0x1] FL/FR
sad_count               1
sad0_coding_type        [0x1] LPCM
sad0_channels           2
sad0_rates              [0x4e0] 32000 44100 48000 96000
sad0_bits               [0xe0000] 16 20 24

Thank you very much,
-- Alex

PS As agreed, no dmesg.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1374973393.f86fa8A0.14210
Date: Sun, 28 Jul 2013 01:03:13 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051#c96">Comment # 96</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - No nouveau HDMI sound on NVIDIA GT430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051">bug 67051</a>
              from <span class="vcard"><a class="email" href="mailto:alupu01&#64;gmail.com" title="Alex &lt;alupu01&#64;gmail.com&gt;"> <span class="fn">Alex</span></a>
</span></b>
        <pre>Hi Ilia,

VERY GOOD NEWS.  PROBLEM SOLVED!!!  TERRIFIC HDMI SOUND.
And that despite my being continuously in your way!

You deserve at least two tickets to Sochi (if still available).

Quote:
The Olympic Games give a powerful boost to the development of television
technology.  The Games in Sochi will be shown entirely in HD format and, in
addition, advanced Ultra High Definition technology will be used in Sochi.

Now if you could somehow procure an NVIDIA card and HDMI cable... (sound
included).
Later, even a monitor and/or television _with_ HDMI input.  True,
they are relatively new, not even six years old...

For the record:
[/linux-3.10.1]$ patch -p1 &lt; /home/alex/hdmi-1.patch ; echo $?
patching file drivers/gpu/drm/nouveau/core/engine/disp/hdanva3.c
0
[/linux-3.10.1]$ patch -p1 &lt; /home/alex/hdminva3.patch ; echo $?
patching file drivers/gpu/drm/nouveau/core/engine/disp/hdminva3.c
0
[/linux-3.10.1]$ patch -p1 &lt; /home/alex/debug-3.patch ; echo $?
patching file drivers/gpu/drm/nouveau/core/engine/disp/hdminva3.c
patching file drivers/gpu/drm/nouveau/core/engine/disp/sornv50.c
patching file drivers/gpu/drm/nouveau/nv50_display.c
0
[/linux-3.10.1]$ patch -p1 &lt; /home/alex/mthd-1.patch ; echo $?
patching file drivers/gpu/drm/nouveau/core/include/core/class.h
0

cat /proc/asound/card1/eld#3.0
monitor_present         1
eld_valid               1
monitor_name            ASUS VE258
connection_type         HDMI
eld_version             [0x2] CEA-861D or below
edid_version            [0x3] CEA-861-B, C or D
manufacture_id          0x6904
product_id              0x25f1
port_id                 0x0
support_hdcp            0
support_ai              0
audio_sync_delay        0
speakers                [0x1] FL/FR
sad_count               1
sad0_coding_type        [0x1] LPCM
sad0_channels           2
sad0_rates              [0x4e0] 32000 44100 48000 96000
sad0_bits               [0xe0000] 16 20 24

Thank you very much,
-- Alex

PS As agreed, no dmesg.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1374973393.f86fa8A0.14210--

--===============1226243734==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1226243734==--
