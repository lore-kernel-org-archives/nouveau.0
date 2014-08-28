From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 83168] New: No display after suspend to RAM
Date: Thu, 28 Aug 2014 00:19:27 +0000
Message-ID: <bug-83168-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0736236165=="
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


--===============0736236165==
Content-Type: multipart/alternative; boundary="1409185167.45211.25329"; charset="us-ascii"


--1409185167.45211.25329
Date: Thu, 28 Aug 2014 00:19:27 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=83168

          Priority: medium
            Bug ID: 83168
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: No display after suspend to RAM
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: nsajko-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 105362
  --> https://bugs.freedesktop.org/attachment.cgi?id=105362&action=edit
the kernel log

When Linux resumes after suspension to RAM, I get no display until next  
boot, but the backlight is on. I think this was true since I started     
using this distro, but I rarely tried to use suspend.                   
This happens invariantly to Xorg.                                       
Although my hardware is 64-bit, I use a 32-bit Linux.                   

Software versions:                                                      

* Linux 3.16.1                                                          

* libdrm 2.4.56                                                         

* mesa 10.2.6                                                           

* xf86-video-nouveau 1.0.10                                             

nouveau reports errors like these to kernel log when the display should 
turn back on:                                                           

[  153.783362] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00001e00 FAULT
at 0x6813c8
[  153.788735] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00002e00 FAULT
at 0x6813c8
[  153.791840] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0xf5153d80 FAULT
at 0x6813c8

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1409185167.45211.25329
Date: Thu, 28 Aug 2014 00:19:27 +0000
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
   title="NEW --- - No display after suspend to RAM"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=83168">83168</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>No display after suspend to RAM
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
          <td>nsajko&#64;gmail.com
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
        <pre>Created <span class=""><a href="attachment.cgi?id=105362" name="attach_105362" title="the kernel log">attachment 105362</a> <a href="attachment.cgi?id=105362&amp;action=edit" title="the kernel log">[details]</a></span>
the kernel log

When Linux resumes after suspension to RAM, I get no display until next  
boot, but the backlight is on. I think this was true since I started     
using this distro, but I rarely tried to use suspend.                   
This happens invariantly to Xorg.                                       
Although my hardware is 64-bit, I use a 32-bit Linux.                   

Software versions:                                                      

* Linux 3.16.1                                                          

* libdrm 2.4.56                                                         

* mesa 10.2.6                                                           

* xf86-video-nouveau 1.0.10                                             

nouveau reports errors like these to kernel log when the display should 
turn back on:                                                           

[  153.783362] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00001e00 FAULT
at 0x6813c8
[  153.788735] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0x00002e00 FAULT
at 0x6813c8
[  153.791840] nouveau E[    PBUS][0000:01:00.0] MMIO write of 0xf5153d80 FAULT
at 0x6813c8</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1409185167.45211.25329--

--===============0736236165==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0736236165==--
