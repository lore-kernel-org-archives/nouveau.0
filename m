From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 91632] New: Crash in nouveau
Date: Fri, 14 Aug 2015 08:26:09 +0000
Message-ID: <bug-91632-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1843752347=="
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


--===============1843752347==
Content-Type: multipart/alternative; boundary="1439540769.F0cD0.30058"; charset="UTF-8"


--1439540769.F0cD0.30058
Date: Fri, 14 Aug 2015 08:26:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=91632

            Bug ID: 91632
           Summary: Crash in nouveau
           Product: Mesa
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: kde-7WRYCqIwvBxWk0Htik3J/w@public.gmane.org
        QA Contact: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org

I have been looking into why QtWebEngine crashes with the nouveau driver, but
the crashes appears asserts in the driver and not our code.

Any idea about what could trigger it:


#3  0x00007ffff0f032d2 in __GI___assert_fail
(assertion=assertion@entry=0x7fffe1d77aa9 "kref", 
    file=file@entry=0x7fffe1d77a8a "../../nouveau/pushbuf.c",
line=line@entry=726, 
    function=function@entry=0x7fffe1d77ad0 <__PRETTY_FUNCTION__.6213>
"nouveau_pushbuf_data") at assert.c:101
#4  0x00007fffe1d76284 in nouveau_pushbuf_data (push=push@entry=0x598d40,
bo=0x5ace30, offset=115624, length=20)
    at ../../nouveau/pushbuf.c:726
#5  0x00007fffe1d761cb in nouveau_pushbuf_data (push=push@entry=0x598d40,
bo=bo@entry=0x0, offset=offset@entry=0, 
    length=length@entry=0) at ../../nouveau/pushbuf.c:718
#6  0x00007fffe1d762ea in pushbuf_submit (push=push@entry=0x598d40,
chan=<optimized out>, chan=<optimized out>)
    at ../../nouveau/pushbuf.c:329
#7  0x00007fffe1d7656e in pushbuf_flush (push=push@entry=0x598d40) at
../../nouveau/pushbuf.c:404
#8  0x00007fffe1d77180 in nouveau_pushbuf_kick (push=0x598d40, chan=<optimized
out>) at ../../nouveau/pushbuf.c:778
#9  0x00007fffe246d766 in ?? () from
/usr/lib/x86_64-linux-gnu/dri/nouveau_dri.so
#10 0x00007fffe2182024 in ?? () from
/usr/lib/x86_64-linux-gnu/dri/nouveau_dri.so
<snip>
#15 0x00007ffff1cda345 in glXMakeCurrentReadSGI () from
/usr/lib/x86_64-linux-gnu/libGL.so.1

-- 
You are receiving this mail because:
You are the QA Contact for the bug.
You are the assignee for the bug.

--1439540769.F0cD0.30058
Date: Fri, 14 Aug 2015 08:26:09 +0000
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
   title="NEW - Crash in nouveau"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=91632">91632</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Crash in nouveau
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
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
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
          <td>kde&#64;carewolf.com
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I have been looking into why QtWebEngine crashes with the nouveau driver, but
the crashes appears asserts in the driver and not our code.

Any idea about what could trigger it:


#3  0x00007ffff0f032d2 in __GI___assert_fail
(assertion=assertion&#64;entry=0x7fffe1d77aa9 &quot;kref&quot;, 
    file=file&#64;entry=0x7fffe1d77a8a &quot;../../nouveau/pushbuf.c&quot;,
line=line&#64;entry=726, 
    function=function&#64;entry=0x7fffe1d77ad0 &lt;__PRETTY_FUNCTION__.6213&gt;
&quot;nouveau_pushbuf_data&quot;) at assert.c:101
#4  0x00007fffe1d76284 in nouveau_pushbuf_data (push=push&#64;entry=0x598d40,
bo=0x5ace30, offset=115624, length=20)
    at ../../nouveau/pushbuf.c:726
#5  0x00007fffe1d761cb in nouveau_pushbuf_data (push=push&#64;entry=0x598d40,
bo=bo&#64;entry=0x0, offset=offset&#64;entry=0, 
    length=length&#64;entry=0) at ../../nouveau/pushbuf.c:718
#6  0x00007fffe1d762ea in pushbuf_submit (push=push&#64;entry=0x598d40,
chan=&lt;optimized out&gt;, chan=&lt;optimized out&gt;)
    at ../../nouveau/pushbuf.c:329
#7  0x00007fffe1d7656e in pushbuf_flush (push=push&#64;entry=0x598d40) at
../../nouveau/pushbuf.c:404
#8  0x00007fffe1d77180 in nouveau_pushbuf_kick (push=0x598d40, chan=&lt;optimized
out&gt;) at ../../nouveau/pushbuf.c:778
#9  0x00007fffe246d766 in ?? () from
/usr/lib/x86_64-linux-gnu/dri/nouveau_dri.so
#10 0x00007fffe2182024 in ?? () from
/usr/lib/x86_64-linux-gnu/dri/nouveau_dri.so
&lt;snip&gt;
#15 0x00007ffff1cda345 in glXMakeCurrentReadSGI () from
/usr/lib/x86_64-linux-gnu/libGL.so.1</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the QA Contact for the bug.</li>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1439540769.F0cD0.30058--

--===============1843752347==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1843752347==--
