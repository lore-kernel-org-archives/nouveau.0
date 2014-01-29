From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 74195] [NVCE] Responsivity to input with vsync on is
 slower after update
Date: Wed, 29 Jan 2014 21:12:36 +0000
Message-ID: <bug-74195-8800-45RP0qlblr@http.bugs.freedesktop.org/>
References: <bug-74195-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0738641485=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-74195-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0738641485==
Content-Type: multipart/alternative; boundary="1391029956.aeCdfEc31.4661"; charset="us-ascii"


--1391029956.aeCdfEc31.4661
Date: Wed, 29 Jan 2014 21:12:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=74195

--- Comment #2 from Jan Janecek <janjanjanx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I can confirm that 0fa9061ae8c10a9178d696cf48d94c3bf2848f9f has the problem and
b9a3140ce8fcd616b02533fbdef375a87a910daf (previous commit) does'nt.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1391029956.aeCdfEc31.4661
Date: Wed, 29 Jan 2014 21:12:36 +0000
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
   title="NEW --- - [NVCE] Responsivity to input with vsync on is slower after update"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74195#c2">Comment # 2</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVCE] Responsivity to input with vsync on is slower after update"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=74195">bug 74195</a>
              from <span class="vcard"><a class="email" href="mailto:janjanjanx&#64;gmail.com" title="Jan Janecek &lt;janjanjanx&#64;gmail.com&gt;"> <span class="fn">Jan Janecek</span></a>
</span></b>
        <pre>I can confirm that 0fa9061ae8c10a9178d696cf48d94c3bf2848f9f has the problem and
b9a3140ce8fcd616b02533fbdef375a87a910daf (previous commit) does'nt.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1391029956.aeCdfEc31.4661--

--===============0738641485==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0738641485==--
