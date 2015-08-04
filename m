From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91557] New: [NVE4] freezes: HUB_INIT timed out
Date: Tue, 04 Aug 2015 17:34:38 +0000
Message-ID: <bug-91557-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0503668845=="
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


--===============0503668845==
Content-Type: multipart/alternative; boundary="1438709678.7DC14B2D1.14950"; charset="UTF-8"


--1438709678.7DC14B2D1.14950
Date: Tue, 4 Aug 2015 17:34:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91557

            Bug ID: 91557
           Summary: [NVE4] freezes: HUB_INIT timed out
           Product: xorg
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: wolf480-khu2bkKidpXVItvQsEIGlw@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

Created attachment 117518
  --> https://bugs.freedesktop.org/attachment.cgi?id=117518&action=edit
dmesg log from freeze with runpm=0

I have a Medion X7827 laptop with GK104 GPU in an Optimus setup, running:
Linux 4.1.2 x86_64
Mesa 10.6.2
Xorg 1.17.2

I've been experiencing some freezes:
- a total freeze (no ping, no sysrq, only hard reset) shortly after xorg start
- if nouveau is loaded *without* runpm=0
- a recoverable freeze (sysrq+K worked) when exiting xorg - if nouveau is
loaded *with* runpm=0

On #nouveau IRC channel I've been told to try the hack-gk106m branch of this
repository: http://... , with runpm=0
At first I thought it helped, but then I noticed the freezez happen randomly.

When runpm=0 is set, the freeze has about 60% chance of happening. I've tested
it with both in-tree nouveau.ko and one built from hack-gk106m branch, and
looks like the chance is the same on both.
When the freeze happens, there's either a "HUB_INIT timed out" message or
"grctx template channel unload timeout" message in dmesg.
If the freeze is to happen, the error message shows up at nouveau module load
time, and then again when Xorg starts. Full logs in attachments.

I did mmiotraces of the nouveau.ko from hack-gk106m branch (can repeat with
in-tree nouveau.ko if necessary), with runpm=0, for all of the cases:
- the driver loading succesfully
- the driver loading with HUB_INIT timeout error
- the driver loading with grctx timeout error
The traces and corresponding dmesg logs are in attachments. I have more traces,
but included only one per case.
I did not try to start xorg and trigger the freeze during the mmiotraces,
because:
a) I believe the problem happens at nouveau load time, when it tries to
initialize the GPU
b) The traces compressed with `xz -9` barely fit in the max attachment size of
bugzilla, if they were longer I doubt I could make them fit.

I hope these traces will be useful and help figure out why it sometimes works
and sometimes doesn't, and how to make it always work.
Let me know if there's anything more I could to to help you figure this out.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1438709678.7DC14B2D1.14950
Date: Tue, 4 Aug 2015 17:34:38 +0000
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
   title="NEW - [NVE4] freezes: HUB_INIT timed out"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91557">91557</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[NVE4] freezes: HUB_INIT timed out
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
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
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>wolf480&#64;interia.pl
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=""><a href="attachment.cgi?id=117518" name="attach_117518" title="dmesg log from freeze with runpm=0">attachment 117518</a> <a href="attachment.cgi?id=117518&amp;action=edit" title="dmesg log from freeze with runpm=0">[details]</a></span>
dmesg log from freeze with runpm=0

I have a Medion X7827 laptop with GK104 GPU in an Optimus setup, running:
Linux 4.1.2 x86_64
Mesa 10.6.2
Xorg 1.17.2

I've been experiencing some freezes:
- a total freeze (no ping, no sysrq, only hard reset) shortly after xorg start
- if nouveau is loaded *without* runpm=0
- a recoverable freeze (sysrq+K worked) when exiting xorg - if nouveau is
loaded *with* runpm=0

On #nouveau IRC channel I've been told to try the hack-gk106m branch of this
repository: http://... , with runpm=0
At first I thought it helped, but then I noticed the freezez happen randomly.

When runpm=0 is set, the freeze has about 60% chance of happening. I've tested
it with both in-tree nouveau.ko and one built from hack-gk106m branch, and
looks like the chance is the same on both.
When the freeze happens, there's either a &quot;HUB_INIT timed out&quot; message or
&quot;grctx template channel unload timeout&quot; message in dmesg.
If the freeze is to happen, the error message shows up at nouveau module load
time, and then again when Xorg starts. Full logs in attachments.

I did mmiotraces of the nouveau.ko from hack-gk106m branch (can repeat with
in-tree nouveau.ko if necessary), with runpm=0, for all of the cases:
- the driver loading succesfully
- the driver loading with HUB_INIT timeout error
- the driver loading with grctx timeout error
The traces and corresponding dmesg logs are in attachments. I have more traces,
but included only one per case.
I did not try to start xorg and trigger the freeze during the mmiotraces,
because:
a) I believe the problem happens at nouveau load time, when it tries to
initialize the GPU
b) The traces compressed with `xz -9` barely fit in the max attachment size of
bugzilla, if they were longer I doubt I could make them fit.

I hope these traces will be useful and help figure out why it sometimes works
and sometimes doesn't, and how to make it always work.
Let me know if there's anything more I could to to help you figure this out.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1438709678.7DC14B2D1.14950--

--===============0503668845==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0503668845==--
