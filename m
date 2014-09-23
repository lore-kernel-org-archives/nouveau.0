From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 73267] Nouveau: corrupted laptop screen's EDID info
Date: Tue, 23 Sep 2014 17:29:43 +0000
Message-ID: <bug-73267-8800-6prQAXC9Vy@http.bugs.freedesktop.org/>
References: <bug-73267-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1866826397=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-73267-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1866826397==
Content-Type: multipart/alternative; boundary="1411493383.3C3a6AA2.29287"; charset="us-ascii"


--1411493383.3C3a6AA2.29287
Date: Tue, 23 Sep 2014 17:29:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=73267

chr[] <chris-4cZEHNAa5IdBDgjK7y7TUQ@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |chris-4cZEHNAa5IdBDgjK7y7TUQ@public.gmane.org

--- Comment #5 from chr[] <chris-4cZEHNAa5IdBDgjK7y7TUQ@public.gmane.org> ---
Hello pjv!

I'm back. Dat Bug #34554 happened again after 2 years. Same machine, running
kernel 3.15.10 meanwhile.

I plugged in an external Monitor just as I did that dozend times before since
then. It went on, and the Laptop-Display just went off and disappeared. Xrandr
says it's disconnected and kernel says:

kernel: [66875.422770] nouveau E[     DRM] DDC responded, but no EDID for
LVDS-1

Well, I also got the problem with the edid-tool:

edid-tool /dev/i2c-0 write < edid-fixed
ERROR at 91: i2c_smbus_write_byte_data() failed: No such device or address

and I somehow fixed it by dropping "usleep(10000);" into the write loop.

I feel like putting my finger in that wound ....

If it's a timing issue, how likely is it to turn a i2c-read operation into a
write?
I mean, by hot-plugging in an external display I also hot-plug an i2c-bus.
I know, I can confuse my adourinous i2c-attached gadget this way.

For the record, here are the flipped bits:

--- edid.broken.hex
+++ edid.ok.hex
@@ -1,9 +1,9 @@
-00000000  00 03 00 00 00 07 4f 00  06 10 bb 9c 00 00 00 00
+00000000  00 ff ff ff ff ff ff 00  06 10 bb 9c 00 00 00 00
 00000010  00 13 01 03 80 21 15 78  0a 50 c5 98 58 52 8e 27
 00000020  25 50 54 00 00 00 01 01  01 01 01 01 01 01 01 01
 00000030  01 01 01 01 01 01 7c 2e  90 a0 60 1a 1e 40 30 20
 00000040  36 00 4b cf 10 00 00 18  00 00 00 01 00 06 10 30
 00000050  00 00 00 00 00 00 00 00  0a 20 00 00 00 fe 00 4c
 00000060  50 31 35 34 57 45 33 2d  54 4c 42 31 00 00 00 fe
 00000070  00 43 6f 6c 6f 72 20 4c  43 44 0a 20 20 20 00 dd

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1411493383.3C3a6AA2.29287
Date: Tue, 23 Sep 2014 17:29:43 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:chris&#64;rudorff.com" title="chr[] &lt;chris&#64;rudorff.com&gt;"> <span class="fn">chr[]</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Nouveau: corrupted laptop screen's EDID info"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73267">bug 73267</a>
        <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>chris&#64;rudorff.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Nouveau: corrupted laptop screen's EDID info"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73267#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Nouveau: corrupted laptop screen's EDID info"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=73267">bug 73267</a>
              from <span class="vcard"><a class="email" href="mailto:chris&#64;rudorff.com" title="chr[] &lt;chris&#64;rudorff.com&gt;"> <span class="fn">chr[]</span></a>
</span></b>
        <pre>Hello pjv!

I'm back. Dat <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED INVALID - Nouveau seems to have corrupted my laptop screen's EDID info"
   href="show_bug.cgi?id=34554">Bug #34554</a> happened again after 2 years. Same machine, running
kernel 3.15.10 meanwhile.

I plugged in an external Monitor just as I did that dozend times before since
then. It went on, and the Laptop-Display just went off and disappeared. Xrandr
says it's disconnected and kernel says:

kernel: [66875.422770] nouveau E[     DRM] DDC responded, but no EDID for
LVDS-1

Well, I also got the problem with the edid-tool:

edid-tool /dev/i2c-0 write &lt; edid-fixed
ERROR at 91: i2c_smbus_write_byte_data() failed: No such device or address

and I somehow fixed it by dropping &quot;usleep(10000);&quot; into the write loop.

I feel like putting my finger in that wound ....

If it's a timing issue, how likely is it to turn a i2c-read operation into a
write?
I mean, by hot-plugging in an external display I also hot-plug an i2c-bus.
I know, I can confuse my adourinous i2c-attached gadget this way.

For the record, here are the flipped bits:

--- edid.broken.hex
+++ edid.ok.hex
&#64;&#64; -1,9 +1,9 &#64;&#64;
-00000000  00 03 00 00 00 07 4f 00  06 10 bb 9c 00 00 00 00
+00000000  00 ff ff ff ff ff ff 00  06 10 bb 9c 00 00 00 00
 00000010  00 13 01 03 80 21 15 78  0a 50 c5 98 58 52 8e 27
 00000020  25 50 54 00 00 00 01 01  01 01 01 01 01 01 01 01
 00000030  01 01 01 01 01 01 7c 2e  90 a0 60 1a 1e 40 30 20
 00000040  36 00 4b cf 10 00 00 18  00 00 00 01 00 06 10 30
 00000050  00 00 00 00 00 00 00 00  0a 20 00 00 00 fe 00 4c
 00000060  50 31 35 34 57 45 33 2d  54 4c 42 31 00 00 00 fe
 00000070  00 43 6f 6c 6f 72 20 4c  43 44 0a 20 20 20 00 dd</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1411493383.3C3a6AA2.29287--

--===============1866826397==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1866826397==--
