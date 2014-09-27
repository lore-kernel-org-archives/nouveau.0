From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 70354] [NVE6, NVE7] HUB_INIT timeout on graph init,
 blob fw doesn't help
Date: Sat, 27 Sep 2014 17:11:10 +0000
Message-ID: <bug-70354-8800-nu5rYF9JUp@http.bugs.freedesktop.org/>
References: <bug-70354-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0582869656=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-70354-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0582869656==
Content-Type: multipart/alternative; boundary="1411837870.4C54c75.3404"; charset="us-ascii"


--1411837870.4C54c75.3404
Date: Sat, 27 Sep 2014 17:11:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=70354

--- Comment #33 from Karol Herbst <karolherbst-BUHhN+a2lJ4@public.gmane.org> ---
Created attachment 106965
  --> https://bugs.freedesktop.org/attachment.cgi?id=106965&action=edit
mmiotrace when failing

the diff between both traces is quite interessting. Both happend on the same
machine, the same kernel and the same nouveau.ko file on the same gpu.

Especially the part in the failing trace starting with this:

"[0] 0.000000, FB32 28c <= 1
[0] 0.000000, FB32 219010 => 0
[0] 0.000000, FB32 219010 => 0
[0] 0.000000, FB32 219010 => 0
[0] 0.000000, FB32 219010 => 0
[0] 0.000000, FB32 219010 => 0
[0] 0.000000, FB32 219010 => 0
[0] 0.000000, FB32 219010 => 0
[0] 0.000000, FB32 219010 => 0
[0] 0.000000, FB32 219010 => 0
[0] 0.000000, FB32 219010 => 0
[0] 0.000000, FB32 219010 => 0
... until timeout
"

because this part never happen in the "working" trace

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1411837870.4C54c75.3404
Date: Sat, 27 Sep 2014 17:11:10 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE6,NVE7] HUB_INIT timeout on graph init, blob fw doesn't help"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354#c33">Comment # 33</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE6,NVE7] HUB_INIT timeout on graph init, blob fw doesn't help"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=70354">bug 70354</a>
              from <span class="vcard"><a class="email" href="mailto:karolherbst&#64;me.com" title="Karol Herbst &lt;karolherbst&#64;me.com&gt;"> <span class="fn">Karol Herbst</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=106965" name="attach_106965" title="mmiotrace when failing">attachment 106965</a> <a href="attachment.cgi?id=106965&amp;action=edit" title="mmiotrace when failing">[details]</a></span>
mmiotrace when failing

the diff between both traces is quite interessting. Both happend on the same
machine, the same kernel and the same nouveau.ko file on the same gpu.

Especially the part in the failing trace starting with this:

&quot;[0] 0.000000, FB32 28c &lt;= 1
[0] 0.000000, FB32 219010 =&gt; 0
[0] 0.000000, FB32 219010 =&gt; 0
[0] 0.000000, FB32 219010 =&gt; 0
[0] 0.000000, FB32 219010 =&gt; 0
[0] 0.000000, FB32 219010 =&gt; 0
[0] 0.000000, FB32 219010 =&gt; 0
[0] 0.000000, FB32 219010 =&gt; 0
[0] 0.000000, FB32 219010 =&gt; 0
[0] 0.000000, FB32 219010 =&gt; 0
[0] 0.000000, FB32 219010 =&gt; 0
[0] 0.000000, FB32 219010 =&gt; 0
... until timeout
&quot;

because this part never happen in the &quot;working&quot; trace</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1411837870.4C54c75.3404--

--===============0582869656==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0582869656==--
