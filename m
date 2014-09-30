From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 83550] [NVA5] Monitor not restored after resume
 [regression] [bisected]
Date: Tue, 30 Sep 2014 22:17:36 +0000
Message-ID: <bug-83550-8800-PNJ50v1HY0@http.bugs.freedesktop.org/>
References: <bug-83550-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0823508895=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-83550-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0823508895==
Content-Type: multipart/alternative; boundary="1412115456.E82BEdc3.29569"; charset="us-ascii"


--1412115456.E82BEdc3.29569
Date: Tue, 30 Sep 2014 22:17:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=83550

--- Comment #11 from poma <pomidorabelisima-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---

3.17.0-0.rc7.git0.2.fc21.x86_64  PASSED
  i.e.
3.17.0-0.rc7.git0.1.fc22.x86_64
  patched with 
  "disp/nv50: fix dpms regression on certain boards"
  http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=a68e953

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1412115456.E82BEdc3.29569
Date: Tue, 30 Sep 2014 22:17:36 +0000
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
   title="NEW --- - [NVA5] Monitor not restored after resume [regression] [bisected]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=83550#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVA5] Monitor not restored after resume [regression] [bisected]"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=83550">bug 83550</a>
              from <span class="vcard"><a class="email" href="mailto:pomidorabelisima&#64;gmail.com" title="poma &lt;pomidorabelisima&#64;gmail.com&gt;"> <span class="fn">poma</span></a>
</span></b>
        <pre>
3.17.0-0.rc7.git0.2.fc21.x86_64  PASSED
  i.e.
3.17.0-0.rc7.git0.1.fc22.x86_64
  patched with 
  &quot;disp/nv50: fix dpms regression on certain boards&quot;
  <a href="http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=a68e953">http://cgit.freedesktop.org/~darktama/nouveau/commit/?id=a68e953</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1412115456.E82BEdc3.29569--

--===============0823508895==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0823508895==--
