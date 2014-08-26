From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 83079] New: Dota 2 under Wine freezes with Nouveau
	Drivers
Date: Tue, 26 Aug 2014 04:49:58 +0000
Message-ID: <bug-83079-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0665569930=="
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


--===============0665569930==
Content-Type: multipart/alternative; boundary="1409028598.e8DdEB0.1262"; charset="us-ascii"


--1409028598.e8DdEB0.1262
Date: Tue, 26 Aug 2014 04:49:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=83079

          Priority: medium
            Bug ID: 83079
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Dota 2 under Wine freezes with Nouveau Drivers
          Severity: normal
    Classification: Unclassified
                OS: All
          Reporter: lukebenes-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org
          Hardware: Other
            Status: NEW
           Version: git
         Component: Drivers/DRI/nouveau
           Product: Mesa

Steps to reproduce:
1. Install Steam under Wine
2. Launch Dota 2
3. Start Bot match. Lock in a hero.
Expected Results:
Game starts

Actual Results:
Dota 2 will freeze with the following error in the Wine terminal:
err:seh:setup_exception_record stack overflow 2160 bytes in thread 008b eip
7bc5e05a esp 47cb0ac0 stack 0x47cb0000-0x47cb1000-0x47db0000

tested with:
wine-1.7.24
OpenGL version string: 3.0 Mesa 10.4.0-devel (git-83503f9 2014-08-25
trusty-oibaf-ppa+gallium-nine)

Note if I reboot with the Nvidia proprietary drivers, Dota 2 runs flawlessly
under Wine. Dota 2 also works under Wine with AMD catalyst drivers.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1409028598.e8DdEB0.1262
Date: Tue, 26 Aug 2014 04:49:58 +0000
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
   title="NEW --- - Dota 2 under Wine freezes with Nouveau Drivers"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=83079">83079</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Dota 2 under Wine freezes with Nouveau Drivers
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
          <td>lukebenes&#64;hotmail.com
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
          <td>git
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
        <pre>Steps to reproduce:
1. Install Steam under Wine
2. Launch Dota 2
3. Start Bot match. Lock in a hero.
Expected Results:
Game starts

Actual Results:
Dota 2 will freeze with the following error in the Wine terminal:
err:seh:setup_exception_record stack overflow 2160 bytes in thread 008b eip
7bc5e05a esp 47cb0ac0 stack 0x47cb0000-0x47cb1000-0x47db0000

tested with:
wine-1.7.24
OpenGL version string: 3.0 Mesa 10.4.0-devel (git-83503f9 2014-08-25
trusty-oibaf-ppa+gallium-nine)

Note if I reboot with the Nvidia proprietary drivers, Dota 2 runs flawlessly
under Wine. Dota 2 also works under Wine with AMD catalyst drivers.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1409028598.e8DdEB0.1262--

--===============0665569930==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0665569930==--
