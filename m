From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82835] New: GeForce 8800 GS VDPAU h264 decoding hang
Date: Wed, 20 Aug 2014 03:55:35 +0000
Message-ID: <bug-82835-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0689712981=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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


--===============0689712981==
Content-Type: multipart/alternative; boundary="1408506935.22B0B1.31949"; charset="us-ascii"


--1408506935.22B0B1.31949
Date: Wed, 20 Aug 2014 03:55:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=82835

          Priority: medium
            Bug ID: 82835
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: GeForce 8800 GS VDPAU  h264 decoding hang
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: randrik-JGs/UdohzUI@public.gmane.org
          Hardware: x86 (IA32)
            Status: NEW
           Version: git
         Component: Driver/nouveau
           Product: xorg

Created attachment 104933
  --> https://bugs.freedesktop.org/attachment.cgi?id=104933&action=edit
dmesg from 3.17.0-rc1 kernel, nouveau.debug=debug

So, I  followed  instructions  at
http://nouveau.freedesktop.org/wiki/VideoAcceleration/ and tried vdpau/h264
acceleration for  my  card. It  hanged  happily...

Kernel: both self-compiled 3.14.9 (64-bit) and 3.17.0-rc1 (32-bit) failed.
Mesa: currently OpenGL version string: 3.0 Mesa 10.3.0-devel (git-a4359bc)
libdrm: git d9ce09de12131fa8c5ff2d7c2dbd6b61d8a5fd14 (" exynos: Use symbol
visibility.")
xf86-video-nouveau: 16c885ce9c7bebcfa1252a5d500956dd5f551043 (" Fix event
handling on multi-x-screen configs.")
Xserver: 1.12.4 (from 1.12 branch)

+ MPlayer SVN-r37116 (32  bit, like  full userspace), compiled  with gcc 4.7.3

Command  line:
 mplayer ~/botva/vid/MMC_14_may_2011_four_pilot_whales.mp4 -quiet -vo vdpau -vc
ffh264vdpau -fs (it  hangs  without 'fs', too)

Same  video plays  if  VDPAU  used  only  for  displaying.

vdpauinfo:
 vdpauinfo
display: :0   screen: 0
API version: 1
Information string: G3DVL VDPAU Driver Shared Library version 1.0

Video surface:

name   width height types
-------------------------------------------
420     8192  8192  NV12 YV12
422     8192  8192  UYVY YUYV
444     8192  8192  Y8U8V8A8 V8U8Y8A8

Decoder capabilities:

name               level macbs width height
-------------------------------------------
MPEG1                 0 16384  2048  2048
MPEG2_SIMPLE          3 16384  2048  2048
MPEG2_MAIN            3 16384  2048  2048
H264_BASELINE        41 16384  2048  2048
H264_MAIN            41 16384  2048  2048
H264_HIGH            41 16384  2048  2048

Output surface:

name              width height nat types
----------------------------------------------------
B8G8R8A8          8192  8192    y  NV12 YV12 UYVY YUYV Y8U8V8A8 V8U8Y8A8
R8G8B8A8          8192  8192    y  NV12 YV12 UYVY YUYV Y8U8V8A8 V8U8Y8A8
R10G10B10A2       8192  8192    y  NV12 YV12 UYVY YUYV Y8U8V8A8 V8U8Y8A8
B10G10R10A2       8192  8192    y  NV12 YV12 UYVY YUYV Y8U8V8A8 V8U8Y8A8

Bitmap surface:

name              width height
------------------------------
B8G8R8A8          8192  8192
R8G8B8A8          8192  8192
R10G10B10A2       8192  8192
B10G10R10A2       8192  8192
A8                8192  8192

Video mixer:

feature name                    sup
------------------------------------
DEINTERLACE_TEMPORAL             y
DEINTERLACE_TEMPORAL_SPATIAL     -
INVERSE_TELECINE                 -
NOISE_REDUCTION                  y
SHARPNESS                        y
LUMA_KEY                         -
HIGH QUALITY SCALING - L1        -
HIGH QUALITY SCALING - L2        -
HIGH QUALITY SCALING - L3        -
HIGH QUALITY SCALING - L4        -
HIGH QUALITY SCALING - L5        -
HIGH QUALITY SCALING - L6        -
HIGH QUALITY SCALING - L7        -
HIGH QUALITY SCALING - L8        -
HIGH QUALITY SCALING - L9        -

parameter name                  sup      min      max
-----------------------------------------------------
VIDEO_SURFACE_WIDTH              y        48     2048
VIDEO_SURFACE_HEIGHT             y        48     2048
CHROMA_TYPE                      y
LAYERS                           y         0        4

attribute name                  sup      min      max
-----------------------------------------------------
BACKGROUND_COLOR                 y
CSC_MATRIX                       y
NOISE_REDUCTION_LEVEL            y      0.00     1.00
SHARPNESS_LEVEL                  y     -1.00     1.00
LUMA_KEY_MIN_LUMA                y
LUMA_KEY_MAX_LUMA                y

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1408506935.22B0B1.31949
Date: Wed, 20 Aug 2014 03:55:35 +0000
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
   title="NEW --- - GeForce 8800 GS VDPAU h264 decoding hang"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82835">82835</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>GeForce 8800 GS VDPAU  h264 decoding hang
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
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
          <td>randrik&#64;mail.ru
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
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=104933" name="attach_104933" title="dmesg from 3.17.0-rc1 kernel, nouveau.debug=debug">attachment 104933</a> <a href="attachment.cgi?id=104933&amp;action=edit" title="dmesg from 3.17.0-rc1 kernel, nouveau.debug=debug">[details]</a></span>
dmesg from 3.17.0-rc1 kernel, nouveau.debug=debug

So, I  followed  instructions  at
<a href="http://nouveau.freedesktop.org/wiki/VideoAcceleration/">http://nouveau.freedesktop.org/wiki/VideoAcceleration/</a> and tried vdpau/h264
acceleration for  my  card. It  hanged  happily...

Kernel: both self-compiled 3.14.9 (64-bit) and 3.17.0-rc1 (32-bit) failed.
Mesa: currently OpenGL version string: 3.0 Mesa 10.3.0-devel (git-a4359bc)
libdrm: git d9ce09de12131fa8c5ff2d7c2dbd6b61d8a5fd14 (&quot; exynos: Use symbol
visibility.&quot;)
xf86-video-nouveau: 16c885ce9c7bebcfa1252a5d500956dd5f551043 (&quot; Fix event
handling on multi-x-screen configs.&quot;)
Xserver: 1.12.4 (from 1.12 branch)

+ MPlayer SVN-r37116 (32  bit, like  full userspace), compiled  with gcc 4.7.3

Command  line:
 mplayer ~/botva/vid/MMC_14_may_2011_four_pilot_whales.mp4 -quiet -vo vdpau -vc
ffh264vdpau -fs (it  hangs  without 'fs', too)

Same  video plays  if  VDPAU  used  only  for  displaying.

vdpauinfo:
 vdpauinfo
display: :0   screen: 0
API version: 1
Information string: G3DVL VDPAU Driver Shared Library version 1.0

Video surface:

name   width height types
-------------------------------------------
420     8192  8192  NV12 YV12
422     8192  8192  UYVY YUYV
444     8192  8192  Y8U8V8A8 V8U8Y8A8

Decoder capabilities:

name               level macbs width height
-------------------------------------------
MPEG1                 0 16384  2048  2048
MPEG2_SIMPLE          3 16384  2048  2048
MPEG2_MAIN            3 16384  2048  2048
H264_BASELINE        41 16384  2048  2048
H264_MAIN            41 16384  2048  2048
H264_HIGH            41 16384  2048  2048

Output surface:

name              width height nat types
----------------------------------------------------
B8G8R8A8          8192  8192    y  NV12 YV12 UYVY YUYV Y8U8V8A8 V8U8Y8A8
R8G8B8A8          8192  8192    y  NV12 YV12 UYVY YUYV Y8U8V8A8 V8U8Y8A8
R10G10B10A2       8192  8192    y  NV12 YV12 UYVY YUYV Y8U8V8A8 V8U8Y8A8
B10G10R10A2       8192  8192    y  NV12 YV12 UYVY YUYV Y8U8V8A8 V8U8Y8A8

Bitmap surface:

name              width height
------------------------------
B8G8R8A8          8192  8192
R8G8B8A8          8192  8192
R10G10B10A2       8192  8192
B10G10R10A2       8192  8192
A8                8192  8192

Video mixer:

feature name                    sup
------------------------------------
DEINTERLACE_TEMPORAL             y
DEINTERLACE_TEMPORAL_SPATIAL     -
INVERSE_TELECINE                 -
NOISE_REDUCTION                  y
SHARPNESS                        y
LUMA_KEY                         -
HIGH QUALITY SCALING - L1        -
HIGH QUALITY SCALING - L2        -
HIGH QUALITY SCALING - L3        -
HIGH QUALITY SCALING - L4        -
HIGH QUALITY SCALING - L5        -
HIGH QUALITY SCALING - L6        -
HIGH QUALITY SCALING - L7        -
HIGH QUALITY SCALING - L8        -
HIGH QUALITY SCALING - L9        -

parameter name                  sup      min      max
-----------------------------------------------------
VIDEO_SURFACE_WIDTH              y        48     2048
VIDEO_SURFACE_HEIGHT             y        48     2048
CHROMA_TYPE                      y
LAYERS                           y         0        4

attribute name                  sup      min      max
-----------------------------------------------------
BACKGROUND_COLOR                 y
CSC_MATRIX                       y
NOISE_REDUCTION_LEVEL            y      0.00     1.00
SHARPNESS_LEVEL                  y     -1.00     1.00
LUMA_KEY_MIN_LUMA                y
LUMA_KEY_MAX_LUMA                y</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1408506935.22B0B1.31949--

--===============0689712981==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0689712981==--
