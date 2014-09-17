From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 83992] [NVE0][NVF1] regression,
	linux 3.17 causes gpu lockups
Date: Wed, 17 Sep 2014 13:58:37 +0000
Message-ID: <bug-83992-8800-mr76bYwVgj@http.bugs.freedesktop.org/>
References: <bug-83992-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1364406217=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-83992-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1364406217==
Content-Type: multipart/alternative; boundary="1410962317.6aAfEaC81.20246"; charset="us-ascii"


--1410962317.6aAfEaC81.20246
Date: Wed, 17 Sep 2014 13:58:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=83992

--- Comment #2 from Tom Englund <tomenglund26-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
however reverting e887377338f and 67cfbfdfec9fa so f331a15f84a cleanly reverts
i still get the X lockups

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1410962317.6aAfEaC81.20246
Date: Wed, 17 Sep 2014 13:58:37 +0000
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
   title="NEW --- - [NVE0][NVF1] regression, linux 3.17 causes gpu lockups"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=83992#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE0][NVF1] regression, linux 3.17 causes gpu lockups"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=83992">bug 83992</a>
              from <span class="vcard"><a class="email" href="mailto:tomenglund26&#64;gmail.com" title="Tom Englund &lt;tomenglund26&#64;gmail.com&gt;"> <span class="fn">Tom Englund</span></a>
</span></b>
        <pre>however reverting e887377338f and 67cfbfdfec9fa so f331a15f84a cleanly reverts
i still get the X lockups</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1410962317.6aAfEaC81.20246--

--===============1364406217==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1364406217==--
