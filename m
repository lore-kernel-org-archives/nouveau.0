From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 67597] New: nouveau E Xorg failed to idle channel on
	NVA0
Date: Thu, 01 Aug 2013 00:01:10 +0000
Message-ID: <bug-67597-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0845665801=="
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


--===============0845665801==
Content-Type: multipart/alternative; boundary="1375315270.0Df2441.29268"; charset="us-ascii"


--1375315270.0Df2441.29268
Date: Thu, 1 Aug 2013 00:01:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=67597

          Priority: medium
            Bug ID: 67597
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: nouveau E Xorg failed to idle channel on NVA0
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: critical
    Classification: Unclassified
                OS: Linux (All)
          Reporter: m.meledandri-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Created attachment 83404
  --> https://bugs.freedesktop.org/attachment.cgi?id=83404&action=edit
dmesg-nouveau-crasher-idle-fail

Shortly after resume from suspend on kernel 3.10.4, nouveau crashes (hard
lockup). This is the first nouveau crash I've seen since using xfwm4 and no
compositing. I've been hanging out on the 3.4.x LTS series though, so it's been
safe. 

dmesg attached.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1375315270.0Df2441.29268
Date: Thu, 1 Aug 2013 00:01:10 +0000
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
   title="NEW --- - nouveau E Xorg failed to idle channel on NVA0"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=67597">67597</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>nouveau E Xorg failed to idle channel on NVA0
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>critical
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
          <td>m.meledandri&#64;gmail.com
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
        <pre>Created <span class=""><a href="attachment.cgi?id=83404" name="attach_83404" title="dmesg-nouveau-crasher-idle-fail">attachment 83404</a> <a href="attachment.cgi?id=83404&amp;action=edit" title="dmesg-nouveau-crasher-idle-fail">[details]</a></span>
dmesg-nouveau-crasher-idle-fail

Shortly after resume from suspend on kernel 3.10.4, nouveau crashes (hard
lockup). This is the first nouveau crash I've seen since using xfwm4 and no
compositing. I've been hanging out on the 3.4.x LTS series though, so it's been
safe. 

dmesg attached.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1375315270.0Df2441.29268--

--===============0845665801==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0845665801==--
