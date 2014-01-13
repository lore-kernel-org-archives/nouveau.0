From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73563] New: Continous output of "nouveau E[ DRM] DDC
 responded, but no EDID for VGA-1"
Date: Mon, 13 Jan 2014 16:33:47 +0000
Message-ID: <bug-73563-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1970691481=="
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


--===============1970691481==
Content-Type: multipart/alternative; boundary="1389630827.8dB8c51.16193"; charset="us-ascii"


--1389630827.8dB8c51.16193
Date: Mon, 13 Jan 2014 16:33:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73563

          Priority: medium
            Bug ID: 73563
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Continous output of "nouveau E[     DRM] DDC
                    responded, but no EDID for VGA-1"
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: rose-L/08BfOuEgquzba0o+Ga+bNAH6kLmebB@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

I have NVIDIA Corporation GF119 [GeForce GT 520] graphic card. Together with
linux-3.12.6-gentoo and linux-3.12.7-gentoo I get continously the message 
nouveau E[     DRM] DDC responded, but no EDID for VGA-1:

root@leopard:/root(7)# dmesg | tail
[  955.882385] nouveau E[     DRM] DDC responded, but no EDID for VGA-1
[  966.031081] nouveau E[     DRM] DDC responded, but no EDID for VGA-1
[  976.180466] nouveau E[     DRM] DDC responded, but no EDID for VGA-1
[  986.329133] nouveau E[     DRM] DDC responded, but no EDID for VGA-1
[  996.479201] nouveau E[     DRM] DDC responded, but no EDID for VGA-1
[ 1006.626834] nouveau E[     DRM] DDC responded, but no EDID for VGA-1
[ 1016.776077] nouveau E[     DRM] DDC responded, but no EDID for VGA-1
[ 1026.924983] nouveau E[     DRM] DDC responded, but no EDID for VGA-1
[ 1037.073615] nouveau E[     DRM] DDC responded, but no EDID for VGA-1
[ 1047.222621] nouveau E[     DRM] DDC responded, but no EDID for VGA-1

root@leopard:/root(8)# genlop -t xf86-video-nouveau | tail

     Tue Dec 10 19:31:03 2013 >>> x11-drivers/xf86-video-nouveau-1.0.10
       merge time: 18 seconds.

     Tue Dec 17 04:40:38 2013 >>> x11-drivers/xf86-video-nouveau-1.0.10
       merge time: 18 seconds.

     Tue Dec 31 04:29:31 2013 >>> x11-drivers/xf86-video-nouveau-1.0.10
       merge time: 18 seconds.


root@leopard:/root(10)# genlop -t xorg-server | tail

     Tue Dec 10 19:29:53 2013 >>> x11-base/xorg-server-1.14.99.903-r1
       merge time: 1 minute and 41 seconds.

     Tue Dec 17 04:39:32 2013 >>> x11-base/xorg-server-1.14.99.904
       merge time: 1 minute and 42 seconds.

     Tue Dec 31 04:27:19 2013 >>> x11-base/xorg-server-1.15.0
       merge time: 1 minute and 43 seconds.


X11 is mainly working, sometimes it is hanging (i.e. I can move the mouse
pointer, but I can't activate any window or menu, but I can switch to console
to restart gdm) sometimes it is hanging, that only the powerswitch helps,
sometimes the screenserver hinders me continue to work (because there is no
window to enter the password, and to enter id blindly do not help either).

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1389630827.8dB8c51.16193
Date: Mon, 13 Jan 2014 16:33:47 +0000
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
   title="NEW --- - Continous output of &quot;nouveau E[ DRM] DDC responded, but no EDID for VGA-1&quot;"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73563">73563</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Continous output of &quot;nouveau E[     DRM] DDC responded, but no EDID for VGA-1&quot;
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
          <td>All
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>rose&#64;rz.uni-potsdam.de
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
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
        <pre>I have NVIDIA Corporation GF119 [GeForce GT 520] graphic card. Together with
linux-3.12.6-gentoo and linux-3.12.7-gentoo I get continously the message 
nouveau E[     DRM] DDC responded, but no EDID for VGA-1:

root&#64;leopard:/root(7)# dmesg | tail
[  955.882385] nouveau E[     DRM] DDC responded, but no EDID for VGA-1
[  966.031081] nouveau E[     DRM] DDC responded, but no EDID for VGA-1
[  976.180466] nouveau E[     DRM] DDC responded, but no EDID for VGA-1
[  986.329133] nouveau E[     DRM] DDC responded, but no EDID for VGA-1
[  996.479201] nouveau E[     DRM] DDC responded, but no EDID for VGA-1
[ 1006.626834] nouveau E[     DRM] DDC responded, but no EDID for VGA-1
[ 1016.776077] nouveau E[     DRM] DDC responded, but no EDID for VGA-1
[ 1026.924983] nouveau E[     DRM] DDC responded, but no EDID for VGA-1
[ 1037.073615] nouveau E[     DRM] DDC responded, but no EDID for VGA-1
[ 1047.222621] nouveau E[     DRM] DDC responded, but no EDID for VGA-1

root&#64;leopard:/root(8)# genlop -t xf86-video-nouveau | tail

     Tue Dec 10 19:31:03 2013 &gt;&gt;&gt; x11-drivers/xf86-video-nouveau-1.0.10
       merge time: 18 seconds.

     Tue Dec 17 04:40:38 2013 &gt;&gt;&gt; x11-drivers/xf86-video-nouveau-1.0.10
       merge time: 18 seconds.

     Tue Dec 31 04:29:31 2013 &gt;&gt;&gt; x11-drivers/xf86-video-nouveau-1.0.10
       merge time: 18 seconds.


root&#64;leopard:/root(10)# genlop -t xorg-server | tail

     Tue Dec 10 19:29:53 2013 &gt;&gt;&gt; x11-base/xorg-server-1.14.99.903-r1
       merge time: 1 minute and 41 seconds.

     Tue Dec 17 04:39:32 2013 &gt;&gt;&gt; x11-base/xorg-server-1.14.99.904
       merge time: 1 minute and 42 seconds.

     Tue Dec 31 04:27:19 2013 &gt;&gt;&gt; x11-base/xorg-server-1.15.0
       merge time: 1 minute and 43 seconds.


X11 is mainly working, sometimes it is hanging (i.e. I can move the mouse
pointer, but I can't activate any window or menu, but I can switch to console
to restart gdm) sometimes it is hanging, that only the powerswitch helps,
sometimes the screenserver hinders me continue to work (because there is no
window to enter the password, and to enter id blindly do not help either).</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1389630827.8dB8c51.16193--

--===============1970691481==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1970691481==--
