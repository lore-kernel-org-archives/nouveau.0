From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77378] New: Suspend resume failure with
Date: Sat, 12 Apr 2014 23:56:11 +0000
Message-ID: <bug-77378-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0995320963=="
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


--===============0995320963==
Content-Type: multipart/alternative; boundary="1397346971.f3cFd010.32066"; charset="us-ascii"


--1397346971.f3cFd010.32066
Date: Sat, 12 Apr 2014 23:56:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77378

          Priority: medium
            Bug ID: 77378
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Suspend resume failure with
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: s.brisbane1-JAjqph6Yjy8XSZKaUYBEcQ@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: unspecified
         Component: Drivers/DRI/nouveau
           Product: Mesa

Created attachment 97286
  --> https://bugs.freedesktop.org/attachment.cgi?id=97286&action=edit
dmesg output after resume

Lock up after resume on Ubuntu Trusty with the Ubuntu desktop and gnome+compiz
desktop interface.  No issues with gnome+metacity.

Machine locks up completely with the Unity interface, but is responsive enough
on gnome+compiz to allow switch to dumb tty to produce dmesg output as
attached.  Display on tty7 locked up and scrambled though.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1397346971.f3cFd010.32066
Date: Sat, 12 Apr 2014 23:56:11 +0000
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
   title="NEW --- - Suspend resume failure with"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77378">77378</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Suspend resume failure with
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
          <td>s.brisbane1&#64;physics.ox.ac.uk
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
        <pre>Created <span class=""><a href="attachment.cgi?id=97286" name="attach_97286" title="dmesg output after resume">attachment 97286</a> <a href="attachment.cgi?id=97286&amp;action=edit" title="dmesg output after resume">[details]</a></span>
dmesg output after resume

Lock up after resume on Ubuntu Trusty with the Ubuntu desktop and gnome+compiz
desktop interface.  No issues with gnome+metacity.

Machine locks up completely with the Unity interface, but is responsive enough
on gnome+compiz to allow switch to dumb tty to produce dmesg output as
attached.  Display on tty7 locked up and scrambled though.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1397346971.f3cFd010.32066--

--===============0995320963==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0995320963==--
