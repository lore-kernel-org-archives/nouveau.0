From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70464] New: [NVC3] runpm not working
Date: Mon, 14 Oct 2013 20:02:57 +0000
Message-ID: <bug-70464-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0197755927=="
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


--===============0197755927==
Content-Type: multipart/alternative; boundary="1381780977.f4EAd1.9034"; charset="us-ascii"


--1381780977.f4EAd1.9034
Date: Mon, 14 Oct 2013 20:02:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70464

          Priority: medium
            Bug ID: 70464
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [NVC3] runpm not working
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: michele.cane-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: 7.7 (2011)
         Component: Driver/nouveau
           Product: xorg

Created attachment 87623
  --> https://bugs.freedesktop.org/attachment.cgi?id=87623&action=edit
dmesg with runpm=0

I am running kernel 3.12-rc5 and runpm is not working. The nvidia card (quadro
2000M) is turned off at start but then when called is not turned on.

You can compare the 2 dmesg (one with nouveau.runpm=0 and the other
nouveau.runpm=1).

The procedure I used in both cases is the same:

- xrandr --setprovideroffloadsink nouveau Intel

and then

- DRI_PRIME=1 glxinfo | grep vendor

which in both cases gave:

OpenGL vendor string: nouveau (which is ok)

but on dmesg the card is never turned on

Can I provide more info?

Cheers

Mike

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1381780977.f4EAd1.9034
Date: Mon, 14 Oct 2013 20:02:57 +0000
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
   title="NEW --- - [NVC3] runpm not working"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70464">70464</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVC3] runpm not working
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
          <td>michele.cane&#64;gmail.com
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
          <td>7.7 (2011)
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
        <pre>Created <span class=""><a href="attachment.cgi?id=87623" name="attach_87623" title="dmesg with runpm=0">attachment 87623</a> <a href="attachment.cgi?id=87623&amp;action=edit" title="dmesg with runpm=0">[details]</a></span>
dmesg with runpm=0

I am running kernel 3.12-rc5 and runpm is not working. The nvidia card (quadro
2000M) is turned off at start but then when called is not turned on.

You can compare the 2 dmesg (one with nouveau.runpm=0 and the other
nouveau.runpm=1).

The procedure I used in both cases is the same:

- xrandr --setprovideroffloadsink nouveau Intel

and then

- DRI_PRIME=1 glxinfo | grep vendor

which in both cases gave:

OpenGL vendor string: nouveau (which is ok)

but on dmesg the card is never turned on

Can I provide more info?

Cheers

Mike</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1381780977.f4EAd1.9034--

--===============0197755927==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0197755927==--
