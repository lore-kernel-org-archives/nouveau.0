From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 64746] New: optimus don't use nouveau card
Date: Sat, 18 May 2013 22:59:14 +0000
Message-ID: <bug-64746-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0416468922=="
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


--===============0416468922==
Content-Type: multipart/alternative; boundary="1368917955.FDe6ad30.28907"; charset="us-ascii"


--1368917955.FDe6ad30.28907
Date: Sat, 18 May 2013 22:59:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=64746

          Priority: medium
            Bug ID: 64746
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: optimus don't use nouveau card
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: marccollin7379-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: 9.1
         Component: Drivers/DRI/nouveau
           Product: Mesa

Created attachment 79507
  --> https://bugs.freedesktop.org/attachment.cgi?id=79507&action=edit
dmesg

i have a lenovo s430 laptop it have a intel 4000 and nvidia GT 620M video card.
in bios, optimus is selected.

when i start suse 12.3, nouveau card is never used, intel is used.

when i go in console, try to go back to my kde session... that crash and go
back to kdm login.


in log i see

nouveau W[DRM] voltage table 0x50 unknown
[3.409915] nouveau  [DRM] 3: core 475MHz shader 950MHz memory 900MHz voltage
10mV

xorg.0.log file
http://fr.pastebin.ca/2378194

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1368917955.FDe6ad30.28907
Date: Sat, 18 May 2013 22:59:15 +0000
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
   title="NEW --- - optimus don't use nouveau card"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=64746">64746</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>optimus don't use nouveau card
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
          <td>marccollin7379&#64;gmail.com
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
          <td>9.1
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
        <pre>Created <span class=""><a href="attachment.cgi?id=79507" name="attach_79507" title="dmesg">attachment 79507</a> <a href="attachment.cgi?id=79507&amp;action=edit" title="dmesg">[details]</a></span>
dmesg

i have a lenovo s430 laptop it have a intel 4000 and nvidia GT 620M video card.
in bios, optimus is selected.

when i start suse 12.3, nouveau card is never used, intel is used.

when i go in console, try to go back to my kde session... that crash and go
back to kdm login.


in log i see

nouveau W[DRM] voltage table 0x50 unknown
[3.409915] nouveau  [DRM] 3: core 475MHz shader 950MHz memory 900MHz voltage
10mV

xorg.0.log file
<a href="http://fr.pastebin.ca/2378194">http://fr.pastebin.ca/2378194</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1368917955.FDe6ad30.28907--

--===============0416468922==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0416468922==--
