From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 84285] New: Framebuffer display around grabbing
	cursor
Date: Wed, 24 Sep 2014 15:12:21 +0000
Message-ID: <bug-84285-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1657181309=="
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


--===============1657181309==
Content-Type: multipart/alternative; boundary="1411571541.fd1134C71.28465"; charset="us-ascii"


--1411571541.fd1134C71.28465
Date: Wed, 24 Sep 2014 15:12:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=84285

          Priority: medium
            Bug ID: 84285
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Framebuffer display around grabbing cursor
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: cs-jJRT0G49DP/QT0dZR+AlfA@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Driver/nouveau
           Product: xorg

Xorg version 1.14.4 with nouveau version 1.0.9

This has been happening for over a year with all versions of Xorf and nouveau
that I've used. When the mouse cursor becomes a grabbing hand, the framebuffer
box that is displayed around the hand is the wrong framebuffer. It displays the
xscreensaver's framebuffer.

In case I am using incorrect terminology, assume this scenario:
 1) My xscreensaver is set to show a picture of a cat hanging from a branch.
 2) I logged in from the screensaver and I go to Google Maps.
 3) I move my mouse over the map and the cursor changes from an arrow to a
grabbing hand.

What I see is a box around the grabbing hand that shows the cat instead of the
map. As I move the mouse around, the box moves with it (always around the
cursor and always showing the picture of the cat).

This does not happen if I use the nvidia driver. This has been a bug in Fedora
17, 18, 19, and now 20 - indicating how many versions of Xorg and nouveau have
had this problem.

Please let me know if this is a duplicate. I have searched for years, but I am
certain that I simply cannot stumble upon the correct terminology required to
find a mention of this bug.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1411571541.fd1134C71.28465
Date: Wed, 24 Sep 2014 15:12:21 +0000
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
   title="NEW --- - Framebuffer display around grabbing cursor"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=84285">84285</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Framebuffer display around grabbing cursor
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
          <td>cs&#64;kainaw.com
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
        <pre>Xorg version 1.14.4 with nouveau version 1.0.9

This has been happening for over a year with all versions of Xorf and nouveau
that I've used. When the mouse cursor becomes a grabbing hand, the framebuffer
box that is displayed around the hand is the wrong framebuffer. It displays the
xscreensaver's framebuffer.

In case I am using incorrect terminology, assume this scenario:
 1) My xscreensaver is set to show a picture of a cat hanging from a branch.
 2) I logged in from the screensaver and I go to Google Maps.
 3) I move my mouse over the map and the cursor changes from an arrow to a
grabbing hand.

What I see is a box around the grabbing hand that shows the cat instead of the
map. As I move the mouse around, the box moves with it (always around the
cursor and always showing the picture of the cat).

This does not happen if I use the nvidia driver. This has been a bug in Fedora
17, 18, 19, and now 20 - indicating how many versions of Xorg and nouveau have
had this problem.

Please let me know if this is a duplicate. I have searched for years, but I am
certain that I simply cannot stumble upon the correct terminology required to
find a mention of this bug.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1411571541.fd1134C71.28465--

--===============1657181309==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1657181309==--
