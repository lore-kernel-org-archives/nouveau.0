From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77045] New: HDMI-Monitor toogles between on/off
Date: Fri, 04 Apr 2014 08:59:05 +0000
Message-ID: <bug-77045-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0344135348=="
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


--===============0344135348==
Content-Type: multipart/alternative; boundary="1396601945.FbB12f1.31880"; charset="us-ascii"


--1396601945.FbB12f1.31880
Date: Fri, 4 Apr 2014 08:59:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77045

          Priority: medium
            Bug ID: 77045
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: HDMI-Monitor toogles between on/off
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: bugs.freedesktop.org-nXTNDpp/ZGaccsjhqMPsx7NAH6kLmebB@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: 7.7 (2011)
         Component: Driver/nouveau
           Product: xorg

Created attachment 96893
  --> https://bugs.freedesktop.org/attachment.cgi?id=96893&action=edit
dmesg > dmesg.txt

Dear all,

my second monitor, attached via HDMI-DVI-Adapter keeps turning on/off every
~20min. This is independant on what I am doing! The xorg-screen itself seems to
remain active (windows can be dragged from and to it). The first monitor
remains active.

All Standby-Options are turned off (Monitor set to switch off after one hour).

I can reactivate the monitor by switching to a text-console (ALT-F1) and back
(ALT-F7). nvidia-driver works fine (switched using the provided option of the
proprietary drives section of the Softwaremanager, no nvidia remained after
switching back to nouveau).

lspci | grep VGA
03:00.0 VGA compatible controller: NVIDIA Corporation GF108 [GeForce GT 430]
(rev a1)

 lsb_release -rd
Description:    Ubuntu Trusty Tahr (development branch)
Release:    14.04

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1396601945.FbB12f1.31880
Date: Fri, 4 Apr 2014 08:59:05 +0000
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
   title="NEW --- - HDMI-Monitor toogles between on/off"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77045">77045</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>HDMI-Monitor toogles between on/off
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
          <td>bugs.freedesktop.org&#64;guntramschmidt.de
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
        <pre>Created <span class=""><a href="attachment.cgi?id=96893" name="attach_96893" title="dmesg &gt; dmesg.txt">attachment 96893</a> <a href="attachment.cgi?id=96893&amp;action=edit" title="dmesg &gt; dmesg.txt">[details]</a></span>
dmesg &gt; dmesg.txt

Dear all,

my second monitor, attached via HDMI-DVI-Adapter keeps turning on/off every
~20min. This is independant on what I am doing! The xorg-screen itself seems to
remain active (windows can be dragged from and to it). The first monitor
remains active.

All Standby-Options are turned off (Monitor set to switch off after one hour).

I can reactivate the monitor by switching to a text-console (ALT-F1) and back
(ALT-F7). nvidia-driver works fine (switched using the provided option of the
proprietary drives section of the Softwaremanager, no nvidia remained after
switching back to nouveau).

lspci | grep VGA
03:00.0 VGA compatible controller: NVIDIA Corporation GF108 [GeForce GT 430]
(rev a1)

 lsb_release -rd
Description:    Ubuntu Trusty Tahr (development branch)
Release:    14.04</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1396601945.FbB12f1.31880--

--===============0344135348==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0344135348==--
