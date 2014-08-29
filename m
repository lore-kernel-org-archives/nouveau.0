From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 83244] New: [nvc3/Quadro2000M] external monitor not
 activated after resume (EDID checksum is invalid)
Date: Fri, 29 Aug 2014 12:12:50 +0000
Message-ID: <bug-83244-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2101079231=="
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


--===============2101079231==
Content-Type: multipart/alternative; boundary="1409314370.aB0Fc1.28623"; charset="us-ascii"


--1409314370.aB0Fc1.28623
Date: Fri, 29 Aug 2014 12:12:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=83244

          Priority: medium
            Bug ID: 83244
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [nvc3/Quadro2000M] external monitor not activated
                    after resume (EDID checksum is invalid)
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: michael.weirauch-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: git
         Component: Driver/nouveau
           Product: xorg

Created attachment 105427
  --> https://bugs.freedesktop.org/attachment.cgi?id=105427&action=edit
kernel messages 3.16 git (stripped)

nouveau/linux-2.6 branch linux-3.17
(I have honestly no idea anyore which branch one should follow/test in the last
months...)

Reproduce:
* Laptop in ThinkPad dock, lid closed
* external monitor attached to DVI connector on dock
* suspend (from Gnome)
* resume
* external monitor gets no signal
* opening lid does nothing, have to take out the laptop and laptop LVDS
activates
* putting back into dock gets in previous error state as after resume

Setup:
ThinkPad W520 4276CTO NVC3 (2000M)
openSUSE 12.3 (64bit)
$ zypper search -si --match-exact xorg-x11-driver-video-nouveau xorg-x11-server
Mesa libdrm_nouveau2 kernel
S | Name                          | Typ   | Version            
--+-------------------------------+-------+--------------------
i | Mesa                          | Paket | 9.0.2-34.24.1      
i | kernel                        | Paket | 3.16.0_nouveau+-38 
i | kernel                        | Paket | 3.12.0_nouveau+-23 
i | libdrm_nouveau2               | Paket | 2.4.42-1.1.1       
i | xorg-x11-driver-video-nouveau | Paket | 1.0.6-2.1.1        
i | xorg-x11-server               | Paket | 7.6_1.13.2-1.25.1

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1409314370.aB0Fc1.28623
Date: Fri, 29 Aug 2014 12:12:50 +0000
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
   title="NEW --- - [nvc3/Quadro2000M] external monitor not activated after resume (EDID checksum is invalid)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=83244">83244</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[nvc3/Quadro2000M] external monitor not activated after resume (EDID checksum is invalid)
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
          <td>michael.weirauch&#64;gmail.com
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
          <td>git
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
        <pre>Created <span class=""><a href="attachment.cgi?id=105427" name="attach_105427" title="kernel messages 3.16 git (stripped)">attachment 105427</a> <a href="attachment.cgi?id=105427&amp;action=edit" title="kernel messages 3.16 git (stripped)">[details]</a></span>
kernel messages 3.16 git (stripped)

nouveau/linux-2.6 branch linux-3.17
(I have honestly no idea anyore which branch one should follow/test in the last
months...)

Reproduce:
* Laptop in ThinkPad dock, lid closed
* external monitor attached to DVI connector on dock
* suspend (from Gnome)
* resume
* external monitor gets no signal
* opening lid does nothing, have to take out the laptop and laptop LVDS
activates
* putting back into dock gets in previous error state as after resume

Setup:
ThinkPad W520 4276CTO NVC3 (2000M)
openSUSE 12.3 (64bit)
$ zypper search -si --match-exact xorg-x11-driver-video-nouveau xorg-x11-server
Mesa libdrm_nouveau2 kernel
S | Name                          | Typ   | Version            
--+-------------------------------+-------+--------------------
i | Mesa                          | Paket | 9.0.2-34.24.1      
i | kernel                        | Paket | 3.16.0_nouveau+-38 
i | kernel                        | Paket | 3.12.0_nouveau+-23 
i | libdrm_nouveau2               | Paket | 2.4.42-1.1.1       
i | xorg-x11-driver-video-nouveau | Paket | 1.0.6-2.1.1        
i | xorg-x11-server               | Paket | 7.6_1.13.2-1.25.1</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1409314370.aB0Fc1.28623--

--===============2101079231==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============2101079231==--
