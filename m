From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67051] New: No nouveau HDMI sound on NVIDIA GT430
Date: Thu, 18 Jul 2013 16:00:12 +0000
Message-ID: <bug-67051-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0933914441=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============0933914441==
Content-Type: multipart/alternative; boundary="1374163212.ceFfDdD0.30429"; charset="us-ascii"


--1374163212.ceFfDdD0.30429
Date: Thu, 18 Jul 2013 16:00:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67051

          Priority: medium
            Bug ID: 67051
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: No nouveau HDMI sound on NVIDIA GT430
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: alupu01-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86 (IA32)
            Status: NEW
           Version: git
         Component: Drivers/DRI/nouveau
           Product: Mesa

Created attachment 82618
  --> https://bugs.freedesktop.org/attachment.cgi?id=82618&action=edit
DMESG

PROBLEM:
No HDMI sound (audio) on the nouveau driver.
On NVIDIA "proprietary" driver (same software/physical configuration): 
 perfect HDMI sound.  As would be expected of the nouveau driver as well.
---------------------------------------------------------
SYSTEM:
(B)LFS i686-pc-linux-gnu
kernel 3.10.1 (with its nouveau module)
libdrm: git 2013-07-17 18:44 EST
Xorg_nouveau: git 2013-07-17 18:46 EST
Mesa v9.1.1
Motherboard:  "ASUS P5E-VM HDMI" with Intel G35/ICH9R,
 intel Core2Duo E8400@3.0GHz, 4 GB.
Graphics card:  EVGA GeForce GT430
Monitor: ASUS VE258 (with built-in speakers)
Graphics card connected to the monitor over an HDMI cable
---------------------------------------------------------
AUDIO TEST (typical):
aplay -D plughw:1,9 test.wav
Playing WAVE 'test.wav' : Signed 16 bit Little Endian, Rate 44100 Hz, Stereo
 NO SOUND

---------------------------------------------------------
REFERENCE

lsmod | grep nouveau
nouveau               714966  1
mxm_wmi                  999  1 nouveau
wmi                     5719  2 mxm_wmi,nouveau
ttm                    36916  1 nouveau
video                   9531  1 nouveau
i2c_algo_bit            3711  1 nouveau
drm_kms_helper         19520  1 nouveau
drm                   151580  3 ttm,drm_kms_helper,nouveau
i2c_core               12305  4 drm,drm_kms_helper,i2c_algo_bit,nouveau
cfbfillrect             2446  1 nouveau
cfbimgblt               1711  1 nouveau
cfbcopyarea             2630  1 nouveau
button                  3226  1 nouveau
---------------------------------------------------------
cat /proc/asound/cards
 0 [Intel          ]: HDA-Intel - HDA Intel
                      HDA Intel at 0xfcff8000 irq 45
 1 [NVidia         ]: HDA-Intel - HDA NVidia
                      HDA NVidia at 0xfe9fc000 irq 17
---------------------------------------------------------
cat /proc/asound/card1/eld#3.0
monitor_present         1
eld_valid               0

Note:  NOT a good sign.  By contrast,
       on NVIDIA driver (Linux-x86-319.32):

cat /proc/asound/card1/eld#3.0
monitor_present         1
eld_valid               1
monitor_name            ASUS VE258

connection_type         HDMI
eld_version             [0x2] CEA-861D or below
edid_version            [0x3] CEA-861-B, C or D
manufacture_id          0x6904
product_id              0x25f1
port_id                 0x20000
support_hdcp            0
support_ai              0
audio_sync_delay        0
speakers                [0x1] FL/FR
sad_count               1
sad0_coding_type        [0x1] LPCM
sad0_channels           2
sad0_rates              [0x4e0] 32000 44100 48000 96000
sad0_bits               [0xe0000] 16 20 24
---------------------------------------------------------
aplay -l
**** List of PLAYBACK Hardware Devices ****
card 0: Intel [HDA Intel], device 0: ALC883 Analog [ALC883 Analog]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: Intel [HDA Intel], device 1: ALC883 Digital [ALC883 Digital]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: Intel [HDA Intel], device 3: HDMI 0 [HDMI 0]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: NVidia [HDA NVidia], device 3: HDMI 0 [HDMI 0]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: NVidia [HDA NVidia], device 7: HDMI 0 [HDMI 0]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: NVidia [HDA NVidia], device 8: HDMI 0 [HDMI 0]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: NVidia [HDA NVidia], device 9: HDMI 0 [HDMI 0]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
---------------------------------------------------------
aplay -L
null
    Discard all samples (playback) or generate zero samples (capture)
default:CARD=Intel
    HDA Intel, ALC883 Analog
    Default Audio Device
sysdefault:CARD=Intel
    HDA Intel, ALC883 Analog
    Default Audio Device
front:CARD=Intel,DEV=0
    HDA Intel, ALC883 Analog
    Front speakers
surround40:CARD=Intel,DEV=0
    HDA Intel, ALC883 Analog
    4.0 Surround output to Front and Rear speakers
surround41:CARD=Intel,DEV=0
    HDA Intel, ALC883 Analog
    4.1 Surround output to Front, Rear and Subwoofer speakers
surround50:CARD=Intel,DEV=0
    HDA Intel, ALC883 Analog
    5.0 Surround output to Front, Center and Rear speakers
surround51:CARD=Intel,DEV=0
    HDA Intel, ALC883 Analog
    5.1 Surround output to Front, Center, Rear and Subwoofer speakers
surround71:CARD=Intel,DEV=0
    HDA Intel, ALC883 Analog
    7.1 Surround output to Front, Center, Side, Rear and Woofer speakers
iec958:CARD=Intel,DEV=0
    HDA Intel, ALC883 Digital
    IEC958 (S/PDIF) Digital Audio Output
hdmi:CARD=Intel,DEV=0
    HDA Intel, HDMI 0
    HDMI Audio Output
hdmi:CARD=NVidia,DEV=0
    HDA NVidia, HDMI 0
    HDMI Audio Output
hdmi:CARD=NVidia,DEV=1
    HDA NVidia, HDMI 0
    HDMI Audio Output
hdmi:CARD=NVidia,DEV=2
    HDA NVidia, HDMI 0
    HDMI Audio Output
hdmi:CARD=NVidia,DEV=3
    HDA NVidia, HDMI 0
    HDMI Audio Output

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1374163212.ceFfDdD0.30429
Date: Thu, 18 Jul 2013 16:00:12 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - No nouveau HDMI sound on NVIDIA GT430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67051">67051</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>No nouveau HDMI sound on NVIDIA GT430
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Classification</th>
          <td>Unclassified
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>alupu01&#64;gmail.com
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86 (IA32)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>git
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=82618" name="attach_82618" title="DMESG">attachment 82618</a> <a href="attachment.cgi?id=82618&amp;action=edit" title="DMESG">[details]</a></span>
DMESG

PROBLEM:
No HDMI sound (audio) on the nouveau driver.
On NVIDIA &quot;proprietary&quot; driver (same software/physical configuration): 
 perfect HDMI sound.  As would be expected of the nouveau driver as well.
---------------------------------------------------------
SYSTEM:
(B)LFS i686-pc-linux-gnu
kernel 3.10.1 (with its nouveau module)
libdrm: git 2013-07-17 18:44 EST
Xorg_nouveau: git 2013-07-17 18:46 EST
Mesa v9.1.1
Motherboard:  &quot;ASUS P5E-VM HDMI&quot; with Intel G35/ICH9R,
 intel Core2Duo <a href="mailto:E8400&#64;3.0GHz">E8400&#64;3.0GHz</a>, 4 GB.
Graphics card:  EVGA GeForce GT430
Monitor: ASUS VE258 (with built-in speakers)
Graphics card connected to the monitor over an HDMI cable
---------------------------------------------------------
AUDIO TEST (typical):
aplay -D plughw:1,9 test.wav
Playing WAVE 'test.wav' : Signed 16 bit Little Endian, Rate 44100 Hz, Stereo
 NO SOUND

---------------------------------------------------------
REFERENCE

lsmod | grep nouveau
nouveau               714966  1
mxm_wmi                  999  1 nouveau
wmi                     5719  2 mxm_wmi,nouveau
ttm                    36916  1 nouveau
video                   9531  1 nouveau
i2c_algo_bit            3711  1 nouveau
drm_kms_helper         19520  1 nouveau
drm                   151580  3 ttm,drm_kms_helper,nouveau
i2c_core               12305  4 drm,drm_kms_helper,i2c_algo_bit,nouveau
cfbfillrect             2446  1 nouveau
cfbimgblt               1711  1 nouveau
cfbcopyarea             2630  1 nouveau
button                  3226  1 nouveau
---------------------------------------------------------
cat /proc/asound/cards
 0 [Intel          ]: HDA-Intel - HDA Intel
                      HDA Intel at 0xfcff8000 irq 45
 1 [NVidia         ]: HDA-Intel - HDA NVidia
                      HDA NVidia at 0xfe9fc000 irq 17
---------------------------------------------------------
cat /proc/asound/card1/eld#3.0
monitor_present         1
eld_valid               0

Note:  NOT a good sign.  By contrast,
       on NVIDIA driver (Linux-x86-319.32):

cat /proc/asound/card1/eld#3.0
monitor_present         1
eld_valid               1
monitor_name            ASUS VE258

connection_type         HDMI
eld_version             [0x2] CEA-861D or below
edid_version            [0x3] CEA-861-B, C or D
manufacture_id          0x6904
product_id              0x25f1
port_id                 0x20000
support_hdcp            0
support_ai              0
audio_sync_delay        0
speakers                [0x1] FL/FR
sad_count               1
sad0_coding_type        [0x1] LPCM
sad0_channels           2
sad0_rates              [0x4e0] 32000 44100 48000 96000
sad0_bits               [0xe0000] 16 20 24
---------------------------------------------------------
aplay -l
**** List of PLAYBACK Hardware Devices ****
card 0: Intel [HDA Intel], device 0: ALC883 Analog [ALC883 Analog]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: Intel [HDA Intel], device 1: ALC883 Digital [ALC883 Digital]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: Intel [HDA Intel], device 3: HDMI 0 [HDMI 0]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: NVidia [HDA NVidia], device 3: HDMI 0 [HDMI 0]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: NVidia [HDA NVidia], device 7: HDMI 0 [HDMI 0]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: NVidia [HDA NVidia], device 8: HDMI 0 [HDMI 0]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: NVidia [HDA NVidia], device 9: HDMI 0 [HDMI 0]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
---------------------------------------------------------
aplay -L
null
    Discard all samples (playback) or generate zero samples (capture)
default:CARD=Intel
    HDA Intel, ALC883 Analog
    Default Audio Device
sysdefault:CARD=Intel
    HDA Intel, ALC883 Analog
    Default Audio Device
front:CARD=Intel,DEV=0
    HDA Intel, ALC883 Analog
    Front speakers
surround40:CARD=Intel,DEV=0
    HDA Intel, ALC883 Analog
    4.0 Surround output to Front and Rear speakers
surround41:CARD=Intel,DEV=0
    HDA Intel, ALC883 Analog
    4.1 Surround output to Front, Rear and Subwoofer speakers
surround50:CARD=Intel,DEV=0
    HDA Intel, ALC883 Analog
    5.0 Surround output to Front, Center and Rear speakers
surround51:CARD=Intel,DEV=0
    HDA Intel, ALC883 Analog
    5.1 Surround output to Front, Center, Rear and Subwoofer speakers
surround71:CARD=Intel,DEV=0
    HDA Intel, ALC883 Analog
    7.1 Surround output to Front, Center, Side, Rear and Woofer speakers
iec958:CARD=Intel,DEV=0
    HDA Intel, ALC883 Digital
    IEC958 (S/PDIF) Digital Audio Output
hdmi:CARD=Intel,DEV=0
    HDA Intel, HDMI 0
    HDMI Audio Output
hdmi:CARD=NVidia,DEV=0
    HDA NVidia, HDMI 0
    HDMI Audio Output
hdmi:CARD=NVidia,DEV=1
    HDA NVidia, HDMI 0
    HDMI Audio Output
hdmi:CARD=NVidia,DEV=2
    HDA NVidia, HDMI 0
    HDMI Audio Output
hdmi:CARD=NVidia,DEV=3
    HDA NVidia, HDMI 0
    HDMI Audio Output</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1374163212.ceFfDdD0.30429--

--===============0933914441==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0933914441==--
