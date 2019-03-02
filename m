From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 109812] New: tegra124: Display manager (sddm) not
 showing up after upgrade to mesa 18.3.3 DATA_ERROR INVALID OPERATION
Date: Sat, 02 Mar 2019 10:08:47 +0000
Message-ID: <bug-109812-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1944777208=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1944777208==
Content-Type: multipart/alternative; boundary="15515213270.A1602ad7.4108"
Content-Transfer-Encoding: 7bit


--15515213270.A1602ad7.4108
Date: Sat, 2 Mar 2019 10:08:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109812

            Bug ID: 109812
           Summary: tegra124: Display manager (sddm) not showing up after
                    upgrade to mesa 18.3.3 DATA_ERROR INVALID OPERATION
           Product: Mesa
           Version: 18.3
          Hardware: ARM
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: tristan-c.bastian-Mmb7MZpHnFY@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

Created attachment 143512
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D143512&action=3Dedit
Output of dmesg

Since I upgraded mesa to version 18.3.3 on ArchlinuxARM I'm only getting a
black screen on bootup with my cursor on it..
I'm running kernel 4.20.4
I'm able to move my cursor and also see a different cursor if I move over t=
he
place where the password input field would normally be.

If I downgrade mesa to version 18.3.2 I'm not seeing this error.

I'm seeing a lot of error messages from nouveau in my dmesg.
I've attached the Output of dmesg.

These are basically a lot of:

[   48.566309] nouveau 57000000.gpu: gr: DATA_ERROR 00000003
[INVALID_OPERATION] ch 4 [04001eb000 sddm-greeter[540]] subc 0 class a297 m=
thd
19d0 data 0000003f
[   48.568952] nouveau 57000000.gpu: gr: DATA_ERROR 0000009c [] ch 4
[04001eb000 sddm-greeter[540]] subc 0 class a297 mthd 17e0 data 00000004

Messages..

--=20
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.=

--15515213270.A1602ad7.4108
Date: Sat, 2 Mar 2019 10:08:47 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - tegra124: Display manager (sddm) not showing up after upg=
rade to mesa 18.3.3 DATA_ERROR INVALID OPERATION"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109812">109812</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>tegra124: Display manager (sddm) not showing up after upgrade=
 to mesa 18.3.3 DATA_ERROR INVALID OPERATION
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>18.3
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>ARM
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Drivers/DRI/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>tristan-c.bastian&#64;gmx.de
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D143512=
" name=3D"attach_143512" title=3D"Output of dmesg">attachment 143512</a> <a=
 href=3D"attachment.cgi?id=3D143512&amp;action=3Dedit" title=3D"Output of d=
mesg">[details]</a></span>
Output of dmesg

Since I upgraded mesa to version 18.3.3 on ArchlinuxARM I'm only getting a
black screen on bootup with my cursor on it..
I'm running kernel 4.20.4
I'm able to move my cursor and also see a different cursor if I move over t=
he
place where the password input field would normally be.

If I downgrade mesa to version 18.3.2 I'm not seeing this error.

I'm seeing a lot of error messages from nouveau in my dmesg.
I've attached the Output of dmesg.

These are basically a lot of:

[   48.566309] nouveau 57000000.gpu: gr: DATA_ERROR 00000003
[INVALID_OPERATION] ch 4 [04001eb000 sddm-greeter[540]] subc 0 class a297 m=
thd
19d0 data 0000003f
[   48.568952] nouveau 57000000.gpu: gr: DATA_ERROR 0000009c [] ch 4
[04001eb000 sddm-greeter[540]] subc 0 class a297 mthd 17e0 data 00000004

Messages..</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15515213270.A1602ad7.4108--

--===============1944777208==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1

--===============1944777208==--
