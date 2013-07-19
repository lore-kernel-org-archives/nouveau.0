From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67051] No nouveau HDMI sound on NVIDIA GT430
Date: Fri, 19 Jul 2013 02:10:59 +0000
Message-ID: <bug-67051-8800-iro3Y9IyR3@http.bugs.freedesktop.org/>
References: <bug-67051-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0918658010=="
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


--===============0918658010==
Content-Type: multipart/alternative; boundary="1374199859.dD3Ff0.12664"; charset="us-ascii"


--1374199859.dD3Ff0.12664
Date: Fri, 19 Jul 2013 02:10:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67051

--- Comment #14 from Alex <alupu01-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
SURPRISE, SURPRISE

alex[~]% uname -a
Linux AlexP5 3.7.0 #1 SMP Thu Jul 18 21:38:56 EDT 2013 i686 i686 i386 GNU/Linux

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
MUSIC TO MY HDMI EARS

I'm attaching the respective dmesg and Xorg log.

Ilia:

Thank you for your relentless troubleshooting.
Please, please, don't make me find out (bisect or otherwisw) at what 3.7.x
somebody messed up royally.
(In merchandising circles kernels 3.7+ (up to current 3.10.1) are called
"NEW AND IMPROVED")

Please have those guys clean up their mess as soon as possible (if they have
any professional molecule in their blood).
Thanks again, best wishes,
-- Alex

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1374199859.dD3Ff0.12664
Date: Fri, 19 Jul 2013 02:10:59 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051#c14">Comment # 14</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - No nouveau HDMI sound on NVIDIA GT430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051">bug 67051</a>
              from <span class="vcard"><a class="email" href="mailto:alupu01&#64;gmail.com" title="Alex &lt;alupu01&#64;gmail.com&gt;"> <span class="fn">Alex</span></a>
</span></b>
        <pre>SURPRISE, SURPRISE

alex[~]% uname -a
Linux AlexP5 3.7.0 #1 SMP Thu Jul 18 21:38:56 EDT 2013 i686 i686 i386 GNU/Linux

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
MUSIC TO MY HDMI EARS

I'm attaching the respective dmesg and Xorg log.

Ilia:

Thank you for your relentless troubleshooting.
Please, please, don't make me find out (bisect or otherwisw) at what 3.7.x
somebody messed up royally.
(In merchandising circles kernels 3.7+ (up to current 3.10.1) are called
&quot;NEW AND IMPROVED&quot;)

Please have those guys clean up their mess as soon as possible (if they have
any professional molecule in their blood).
Thanks again, best wishes,
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

--1374199859.dD3Ff0.12664--

--===============0918658010==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0918658010==--
