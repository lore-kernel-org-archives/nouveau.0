From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 83398] New: [NV4B] Screen freeze watching flash site
Date: Tue, 02 Sep 2014 12:56:16 +0000
Message-ID: <bug-83398-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0266987445=="
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


--===============0266987445==
Content-Type: multipart/alternative; boundary="1409662576.c62dDe1F1.3943"; charset="us-ascii"


--1409662576.c62dDe1F1.3943
Date: Tue, 2 Sep 2014 12:56:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=83398

          Priority: medium
            Bug ID: 83398
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [NV4B] Screen freeze watching flash site
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: shuihuzhuan-GANU6spQydw@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 105608
  --> https://bugs.freedesktop.org/attachment.cgi?id=105608&action=edit
dmesg log

Hello,

Here is the config :

cpu : AMD64
Video card : 7600GT (NV40 family)
kernel : 3.16.1
nouveau-dri : 10.2.6
xf86-video-nouveau : 1.0.10
mesa : 10.2.6
flashplugin : 11.2.202.400
gnome-shell : 3.12.2
firefox : 31.0

When I want to see the video at this link (nouvelle-twingo.renault.fr/), the
screen freezes after the first part, when some controls appear on the screen
(don't know if I'm clear...). I can still VT switch (slowly) and reboot.

Here is the complete dmesg.  There are a lot of :

[  976.757586] [TTM] Failed to find memory space for buffer 0xffff8800cf357c00
eviction
[  976.757593] [TTM] No space for ffff8800cf357c00 (900 pages, 3600K, 3M)
[  976.757595] [TTM]   placement[0]=0x00070002 (1)
[  976.757597] [TTM]     has_type: 1
[  976.757598] [TTM]     use_type: 1
[  976.757599] [TTM]     flags: 0x0000000A
[  976.757600] [TTM]     gpu_offset: 0x00000000
[  976.757601] [TTM]     size: 131072
[  976.757602] [TTM]     available_caching: 0x00070000
[  976.757603] [TTM]     default_caching: 0x00010000

And then :

nouveau E[gnome-shell[809]] fail ttm_validate
[  979.430184] nouveau E[gnome-shell[809]] validate vram_list
[  979.430194] nouveau E[gnome-shell[809]] validate: -12
[ 1058.789582] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: LIMIT_COLOR
nstatus: PROTECTION_FAULT
[ 1058.789611] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
gnome-shell[809]] subc 7 class 0x4097 mthd 0x1808 data 0x00000000
[ 1111.505273] nouveau E[     DRM] GPU lockup - switching to software fbcon
[ 1126.781591] nouveau E[Xorg.bin[567]] failed to idle channel 0xcccc0001
[Xorg.bin[567]]

It doesn't seem a duplicate of another bug I had (74320).

Thanks

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1409662576.c62dDe1F1.3943
Date: Tue, 2 Sep 2014 12:56:16 +0000
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
   title="NEW --- - [NV4B] Screen freeze watching flash site"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=83398">83398</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV4B] Screen freeze watching flash site
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
          <td>shuihuzhuan&#64;free.fr
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
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
        <pre>Created <span class=""><a href="attachment.cgi?id=105608" name="attach_105608" title="dmesg log">attachment 105608</a> <a href="attachment.cgi?id=105608&amp;action=edit" title="dmesg log">[details]</a></span>
dmesg log

Hello,

Here is the config :

cpu : AMD64
Video card : 7600GT (NV40 family)
kernel : 3.16.1
nouveau-dri : 10.2.6
xf86-video-nouveau : 1.0.10
mesa : 10.2.6
flashplugin : 11.2.202.400
gnome-shell : 3.12.2
firefox : 31.0

When I want to see the video at this link (nouvelle-twingo.renault.fr/), the
screen freezes after the first part, when some controls appear on the screen
(don't know if I'm clear...). I can still VT switch (slowly) and reboot.

Here is the complete dmesg.  There are a lot of :

[  976.757586] [TTM] Failed to find memory space for buffer 0xffff8800cf357c00
eviction
[  976.757593] [TTM] No space for ffff8800cf357c00 (900 pages, 3600K, 3M)
[  976.757595] [TTM]   placement[0]=0x00070002 (1)
[  976.757597] [TTM]     has_type: 1
[  976.757598] [TTM]     use_type: 1
[  976.757599] [TTM]     flags: 0x0000000A
[  976.757600] [TTM]     gpu_offset: 0x00000000
[  976.757601] [TTM]     size: 131072
[  976.757602] [TTM]     available_caching: 0x00070000
[  976.757603] [TTM]     default_caching: 0x00010000

And then :

nouveau E[gnome-shell[809]] fail ttm_validate
[  979.430184] nouveau E[gnome-shell[809]] validate vram_list
[  979.430194] nouveau E[gnome-shell[809]] validate: -12
[ 1058.789582] nouveau E[  PGRAPH][0000:01:00.0]  ERROR nsource: LIMIT_COLOR
nstatus: PROTECTION_FAULT
[ 1058.789611] nouveau E[  PGRAPH][0000:01:00.0] ch 3 [0x0013c000
gnome-shell[809]] subc 7 class 0x4097 mthd 0x1808 data 0x00000000
[ 1111.505273] nouveau E[     DRM] GPU lockup - switching to software fbcon
[ 1126.781591] nouveau E[Xorg.bin[567]] failed to idle channel 0xcccc0001
[Xorg.bin[567]]

It doesn't seem a duplicate of another bug I had (74320).

Thanks</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1409662576.c62dDe1F1.3943--

--===============0266987445==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0266987445==--
