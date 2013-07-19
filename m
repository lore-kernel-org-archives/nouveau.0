From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67051] No nouveau HDMI sound on NVIDIA GT430
Date: Fri, 19 Jul 2013 15:39:37 +0000
Message-ID: <bug-67051-8800-NKUBK3LO3j@http.bugs.freedesktop.org/>
References: <bug-67051-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0758974251=="
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


--===============0758974251==
Content-Type: multipart/alternative; boundary="1374248377.3E8Bb0.4209"; charset="us-ascii"


--1374248377.3E8Bb0.4209
Date: Fri, 19 Jul 2013 15:39:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67051

--- Comment #20 from Alex <alupu01-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hi Ilia,

alex[~]% uname -a
Linux AlexP5 3.10.1 #1 SMP Fri Jul 19 11:17:28 EDT 2013 i686 i686 i386
GNU/Linux

alex[~]% cat /proc/asound/card1/eld#3.0
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

alex[~]% aplay -D plughw:1,9 test.wav
Playing WAVE 'test.wav' : Signed 16 bit Little Endian, Rate 44100 Hz, Stereo

NO SOUND !!!

NOTES:
1.  I applied only the hdmi-1 patch.
2.  The original patch (of yesterday, hdminva3.c) has still been in place.

I'll apply hdmi-2 now and see what happens.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1374248377.3E8Bb0.4209
Date: Fri, 19 Jul 2013 15:39:37 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051#c20">Comment # 20</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - No nouveau HDMI sound on NVIDIA GT430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051">bug 67051</a>
              from <span class="vcard"><a class="email" href="mailto:alupu01&#64;gmail.com" title="Alex &lt;alupu01&#64;gmail.com&gt;"> <span class="fn">Alex</span></a>
</span></b>
        <pre>Hi Ilia,

alex[~]% uname -a
Linux AlexP5 3.10.1 #1 SMP Fri Jul 19 11:17:28 EDT 2013 i686 i686 i386
GNU/Linux

alex[~]% cat /proc/asound/card1/eld#3.0
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

alex[~]% aplay -D plughw:1,9 test.wav
Playing WAVE 'test.wav' : Signed 16 bit Little Endian, Rate 44100 Hz, Stereo

NO SOUND !!!

NOTES:
1.  I applied only the hdmi-1 patch.
2.  The original patch (of yesterday, hdminva3.c) has still been in place.

I'll apply hdmi-2 now and see what happens.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1374248377.3E8Bb0.4209--

--===============0758974251==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0758974251==--
