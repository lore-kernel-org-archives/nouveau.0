From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 78161] New: [NV96] Artifacts in output of fragment
 program containing not unrolled loops with conditional break
Date: Thu, 01 May 2014 15:29:05 +0000
Message-ID: <bug-78161-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1084794575=="
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


--===============1084794575==
Content-Type: multipart/alternative; boundary="1398958145.eFF51a0.22614"; charset="us-ascii"


--1398958145.eFF51a0.22614
Date: Thu, 1 May 2014 15:29:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=78161

          Priority: medium
            Bug ID: 78161
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
           Summary: [NV96] Artifacts in output of fragment program
                    containing not unrolled loops with conditional break
          Severity: normal
    Classification: Unclassified
                OS: Linux (All)
          Reporter: gzregozrw-5tc4TXWwyLM@public.gmane.org
          Hardware: x86-64 (AMD64)
            Status: NEW
           Version: git
         Component: Drivers/DRI/nouveau
           Product: Mesa

Created attachment 98301
  --> https://bugs.freedesktop.org/attachment.cgi?id=98301&action=edit
apitrace of simple test program.

Problem appear in shaders containing loops with conditional break when loop is
not unrolled by nouveau. I checked emitted code with ST_DEBUG=tgsi
NV50_PROG_DEBUG=1.
Tested with Mesa 10.2.0-devel (git-475f5ff) from 2014-04-30.
This bug exists for more than year, I first saw it in 2013-02.
I think that artifacts appear in areas where is big difference in number of
iterations executed for pixel before breaking from loop.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1398958145.eFF51a0.22614
Date: Thu, 1 May 2014 15:29:05 +0000
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
   title="NEW --- - [NV96] Artifacts in output of fragment program containing not unrolled loops with conditional break"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=78161">78161</a>
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NV96] Artifacts in output of fragment program containing not unrolled loops with conditional break
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
          <td>gzregozrw&#64;wp.pl
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
        <pre>Created <span class=""><a href="attachment.cgi?id=98301" name="attach_98301" title="apitrace of simple test program.">attachment 98301</a> <a href="attachment.cgi?id=98301&amp;action=edit" title="apitrace of simple test program.">[details]</a></span>
apitrace of simple test program.

Problem appear in shaders containing loops with conditional break when loop is
not unrolled by nouveau. I checked emitted code with ST_DEBUG=tgsi
NV50_PROG_DEBUG=1.
Tested with Mesa 10.2.0-devel (git-475f5ff) from 2014-04-30.
This bug exists for more than year, I first saw it in 2013-02.
I think that artifacts appear in areas where is big difference in number of
iterations executed for pixel before breaking from loop.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1398958145.eFF51a0.22614--

--===============1084794575==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1084794575==--
