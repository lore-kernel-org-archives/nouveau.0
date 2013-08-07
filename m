From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 61287] (bisected) kernel>=3.7 breaks nouveau with
 acceleration for GeForce 6150SE nForce 430
Date: Wed, 07 Aug 2013 15:33:42 +0000
Message-ID: <bug-61287-8800-dimQR4lBc1@http.bugs.freedesktop.org/>
References: <bug-61287-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0941809241=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-61287-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0941809241==
Content-Type: multipart/alternative; boundary="1375889622.6AA3A2.6868"; charset="us-ascii"


--1375889622.6AA3A2.6868
Date: Wed, 7 Aug 2013 15:33:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=61287

--- Comment #11 from Frank Schaefer <fschaefer.oss-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> ---
It definitely wasn't fixed up to the first 3.10-rc's.
Although it was pretty reproducable in my case, it sometimes worked fine for a
few minutes, so a quick test isn't enough.

I doubt it will ever be fixed again. That's why I'm on Radeon hardware now.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1375889622.6AA3A2.6868
Date: Wed, 7 Aug 2013 15:33:42 +0000
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
   title="NEW --- - (bisected) kernel&gt;=3.7 breaks nouveau with acceleration for GeForce 6150SE nForce 430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61287#c11">Comment # 11</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - (bisected) kernel&gt;=3.7 breaks nouveau with acceleration for GeForce 6150SE nForce 430"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=61287">bug 61287</a>
              from <span class="vcard"><a class="email" href="mailto:fschaefer.oss&#64;googlemail.com" title="Frank Schaefer &lt;fschaefer.oss&#64;googlemail.com&gt;"> <span class="fn">Frank Schaefer</span></a>
</span></b>
        <pre>It definitely wasn't fixed up to the first 3.10-rc's.
Although it was pretty reproducable in my case, it sometimes worked fine for a
few minutes, so a quick test isn't enough.

I doubt it will ever be fixed again. That's why I'm on Radeon hardware now.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1375889622.6AA3A2.6868--

--===============0941809241==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0941809241==--
