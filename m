From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 59597] New: Segmentation fault when moving (part of)
 window outside screen area
Date: Sat, 19 Jan 2013 19:20:37 +0000
Message-ID: <bug-59597-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1765927403=="
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


--===============1765927403==
Content-Type: multipart/alternative; boundary="1358623237.CeFCf2a0.32566"; charset="us-ascii"


--1358623237.CeFCf2a0.32566
Date: Sat, 19 Jan 2013 19:20:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=59597

          Priority: medium
            Bug ID: 59597
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: Segmentation fault when moving (part of) window
                    outside screen area
          Severity: major
    Classification: Unclassified
                OS: Linux (All)
          Reporter: bugs.freedesktop-AKmYONJMgVsEZ6m2XrtfIFpr/1R2p/CL@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: unspecified
         Component: Drivers/DRI/nouveau
           Product: Mesa

Created attachment 73298
  --> https://bugs.freedesktop.org/attachment.cgi?id=73298&action=edit
Log file containing backtrace

Hi, 

On a fresh install of Ubuntu 12.10, using the (default) nouveau graphics
driver, I am able to crash the display manager by moving any window outside the
screen area.

Using other graphics-drivers (nvidia proprietary), there are no problems with
having windows outside the screen area. 


I've attached a the Xorg.0.log logfile which contains a backtrace. 

My graphics card is an NVidia GeForce GTX 660 Ti Amp Edition. 


Please let me know if you need any other log-files from the system. 


Thanks

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1358623237.CeFCf2a0.32566
Date: Sat, 19 Jan 2013 19:20:37 +0000
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
   title="NEW --- - Segmentation fault when moving (part of) window outside screen area"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=59597">59597</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Segmentation fault when moving (part of) window outside screen area
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>major
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
          <td>bugs.freedesktop&#64;lindbergonline.dk
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
        <pre>Created <span class=""><a href="attachment.cgi?id=73298" name="attach_73298" title="Log file containing backtrace">attachment 73298</a> <a href="attachment.cgi?id=73298&amp;action=edit" title="Log file containing backtrace">[details]</a></span>
Log file containing backtrace

Hi, 

On a fresh install of Ubuntu 12.10, using the (default) nouveau graphics
driver, I am able to crash the display manager by moving any window outside the
screen area.

Using other graphics-drivers (nvidia proprietary), there are no problems with
having windows outside the screen area. 


I've attached a the Xorg.0.log logfile which contains a backtrace. 

My graphics card is an NVidia GeForce GTX 660 Ti Amp Edition. 


Please let me know if you need any other log-files from the system. 


Thanks</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1358623237.CeFCf2a0.32566--

--===============1765927403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1765927403==--
