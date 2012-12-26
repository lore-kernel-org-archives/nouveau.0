From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 23223] Regression: Nvidia Geforce 7300 (NV4B) fails
	to suspend
Date: Wed, 26 Dec 2012 11:41:43 +0000
Message-ID: <bug-23223-8800-zW1FIoFTrY@http.bugs.freedesktop.org/>
References: <bug-23223-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0141126654=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-23223-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0141126654==
Content-Type: multipart/alternative; boundary="1356522103.f7b2F721.1816"; charset="us-ascii"


--1356522103.f7b2F721.1816
Date: Wed, 26 Dec 2012 11:41:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=23223

--- Comment #7 from Ronald <ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Just tried v3.8rc1 + nouveau HEAD and a patch from:

https://bugs.freedesktop.org/show_bug.cgi?id=50121#c31 . It suspends now,
altough it takes a while. I hear stuff power down twice, I don't think that's
correct...

Recent rework made things worse, the screen resumed with a black screen. Latest
HEAD with mentioned patch makes stuff regress like pre kernel v3.5 rework: The
screen comes up, slightly garbled. It won't respond, and eventually the entire
screen locks-up.

Any pointers on what to do next??

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1356522103.f7b2F721.1816
Date: Wed, 26 Dec 2012 11:41:43 +0000
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
   title="NEW --- - Regression: Nvidia Geforce 7300 (NV4B) fails to suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=23223#c7">Comment # 7</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Regression: Nvidia Geforce 7300 (NV4B) fails to suspend"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=23223">bug 23223</a>
              from <span class="vcard"><a class="email" href="mailto:ronald645&#64;gmail.com" title="Ronald &lt;ronald645&#64;gmail.com&gt;"> <span class="fn">Ronald</span></a>
</span></b>
        <pre>Just tried v3.8rc1 + nouveau HEAD and a patch from:

<a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [Regression] Since kernel v3.5 several cards fail to resume, introduced by: 'convert to exec engine, and improve channel sync'"
   href="show_bug.cgi?id=50121#c31">https://bugs.freedesktop.org/show_bug.cgi?id=50121#c31</a> . It suspends now,
altough it takes a while. I hear stuff power down twice, I don't think that's
correct...

Recent rework made things worse, the screen resumed with a black screen. Latest
HEAD with mentioned patch makes stuff regress like pre kernel v3.5 rework: The
screen comes up, slightly garbled. It won't respond, and eventually the entire
screen locks-up.

Any pointers on what to do next??</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1356522103.f7b2F721.1816--

--===============0141126654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0141126654==--
