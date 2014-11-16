From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 86356] New: [nv50] Graphical glitches in dota2
Date: Sun, 16 Nov 2014 21:46:00 +0000
Message-ID: <bug-86356-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2067261783=="
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


--===============2067261783==
Content-Type: multipart/alternative; boundary="1416174360.348aDA0.27202"; charset="UTF-8"


--1416174360.348aDA0.27202
Date: Sun, 16 Nov 2014 21:46:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=86356

            Bug ID: 86356
           Summary: [nv50] Graphical glitches in dota2
           Product: Mesa
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

Created attachment 109567
  --> https://bugs.freedesktop.org/attachment.cgi?id=109567&action=edit
Screen shot of the issue, from a trimmed trace

It seems that one of the dota2 updates over the last month or so introduced a
regression causing visual glitches as shown in the attached files.

Originally I've assumed to be a mesa regression, but it seems that's not the
case  - old, previously working mesa produces the same output.

MESA_EXTENSION_OVERRIDE=-GL_ARB_draw_elements_base_vertex makes no difference,
plus replaying a trace recorded on i965/snb (no issues there) exhibits the same
glitches.


Note: After trimming the trace some textures are not missing and the text
appears block. The trace plus a screenshot of a non-trimmed trace will follow
shortly.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1416174360.348aDA0.27202
Date: Sun, 16 Nov 2014 21:46:00 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><table border="1" cellspacing="0" cellpadding="8">
        <tr>
          <th>Bug ID</th>
          <td><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [nv50] Graphical glitches in dota2"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=86356">86356</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[nv50] Graphical glitches in dota2
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>Mesa
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
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
          <td>emil.l.velikov&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=109567" name="attach_109567" title="Screen shot of the issue, from a trimmed trace">attachment 109567</a> <a href="attachment.cgi?id=109567&amp;action=edit" title="Screen shot of the issue, from a trimmed trace">[details]</a></span>
Screen shot of the issue, from a trimmed trace

It seems that one of the dota2 updates over the last month or so introduced a
regression causing visual glitches as shown in the attached files.

Originally I've assumed to be a mesa regression, but it seems that's not the
case  - old, previously working mesa produces the same output.

MESA_EXTENSION_OVERRIDE=-GL_ARB_draw_elements_base_vertex makes no difference,
plus replaying a trace recorded on i965/snb (no issues there) exhibits the same
glitches.


Note: After trimming the trace some textures are not missing and the text
appears block. The trace plus a screenshot of a non-trimmed trace will follow
shortly.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1416174360.348aDA0.27202--

--===============2067261783==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2067261783==--
