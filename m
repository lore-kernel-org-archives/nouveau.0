From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71382] New: Nouveau dmesg error, computer hangs
Date: Fri, 08 Nov 2013 10:02:54 +0000
Message-ID: <bug-71382-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0760168743=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0760168743==
Content-Type: multipart/alternative; boundary="1383904975.1543bBe1.1856"; charset="us-ascii"


--1383904975.1543bBe1.1856
Date: Fri, 8 Nov 2013 10:02:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71382

          Priority: medium
            Bug ID: 71382
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Nouveau dmesg error, computer hangs
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: martin.kaffanke-RbZlAiThDcE@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 88884
  --> https://bugs.freedesktop.org/attachment.cgi?id=88884&action=edit
dmesg output as long as I can get ssh on my machine

Hi there,

Slowly I'm getting sick of that many hangs on my computer.  Sometimes, at most
if i login to my account (using ubuntu and unity) and imediatelly start firefox
and thunderbird at the same time, my computer gets bad stripes and is not
reachable via ssh anymore.

~$ uname -a
Linux martin-desktop 3.11.0-12-generic #19-Ubuntu SMP Wed Oct 9 16:20:46 UTC
2013 x86_64 x86_64 x86_64 GNU/Linux

I will add a dmesg, maybe you can tell me if this is a nouveau bug or does it
belong to unity or compiz?  I hope you can tell me how to get additional
information about that.

The dmesg output is of course not all, because I cannot get a dmesg when it
allready hangs.  This is just before it started to hang.

Thanks,
Martin

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1383904975.1543bBe1.1856
Date: Fri, 8 Nov 2013 10:02:55 +0000
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
   title="NEW --- - Nouveau dmesg error, computer hangs"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71382">71382</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Nouveau dmesg error, computer hangs
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
          <td>martin.kaffanke&#64;gmx.at
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
        <pre>Created <span class=""><a href="attachment.cgi?id=88884" name="attach_88884" title="dmesg output as long as I can get ssh on my machine">attachment 88884</a> <a href="attachment.cgi?id=88884&amp;action=edit" title="dmesg output as long as I can get ssh on my machine">[details]</a></span>
dmesg output as long as I can get ssh on my machine

Hi there,

Slowly I'm getting sick of that many hangs on my computer.  Sometimes, at most
if i login to my account (using ubuntu and unity) and imediatelly start firefox
and thunderbird at the same time, my computer gets bad stripes and is not
reachable via ssh anymore.

~$ uname -a
Linux martin-desktop 3.11.0-12-generic #19-Ubuntu SMP Wed Oct 9 16:20:46 UTC
2013 x86_64 x86_64 x86_64 GNU/Linux

I will add a dmesg, maybe you can tell me if this is a nouveau bug or does it
belong to unity or compiz?  I hope you can tell me how to get additional
information about that.

The dmesg output is of course not all, because I cannot get a dmesg when it
allready hangs.  This is just before it started to hang.

Thanks,
Martin</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1383904975.1543bBe1.1856--

--===============0760168743==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0760168743==--
