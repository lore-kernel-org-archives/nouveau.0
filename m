From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 82843] [NV96][Regression][Bisected] Failure to resume
Date: Wed, 20 Aug 2014 06:47:13 +0000
Message-ID: <bug-82843-8800-DHMMQaFWuc@http.bugs.freedesktop.org/>
References: <bug-82843-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0397521500=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-82843-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0397521500==
Content-Type: multipart/alternative; boundary="1408517233.2A1ad1.21280"; charset="us-ascii"


--1408517233.2A1ad1.21280
Date: Wed, 20 Aug 2014 06:47:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=82843

--- Comment #2 from Trevor Davenport <trevor.davenport-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I tried reverting this commit on top of 3.16 but it still doesn't work so it
appears something else has changed since this that also isn't quite right.  

Before the bad commit resume was quite reliable.  After it always fails.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1408517233.2A1ad1.21280
Date: Wed, 20 Aug 2014 06:47:13 +0000
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
   title="NEW --- - [NV96][Regression][Bisected] Failure to resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82843#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NV96][Regression][Bisected] Failure to resume"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=82843">bug 82843</a>
              from <span class="vcard"><a class="email" href="mailto:trevor.davenport&#64;gmail.com" title="Trevor Davenport &lt;trevor.davenport&#64;gmail.com&gt;"> <span class="fn">Trevor Davenport</span></a>
</span></b>
        <pre>I tried reverting this commit on top of 3.16 but it still doesn't work so it
appears something else has changed since this that also isn't quite right.  

Before the bad commit resume was quite reliable.  After it always fails.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1408517233.2A1ad1.21280--

--===============0397521500==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0397521500==--
