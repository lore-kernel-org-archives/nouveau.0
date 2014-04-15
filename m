From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 77494] [NVE7] fails to load with error -22
Date: Tue, 15 Apr 2014 19:00:22 +0000
Message-ID: <bug-77494-8800-zLdCnMGYmP@http.bugs.freedesktop.org/>
References: <bug-77494-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0448547522=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-77494-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0448547522==
Content-Type: multipart/alternative; boundary="1397588421.5A7031.5414"; charset="us-ascii"


--1397588421.5A7031.5414
Date: Tue, 15 Apr 2014 19:00:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=77494

--- Comment #5 from Mirko Predosin <mpredosin-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Booting with "nouveau.config=NvBios=PROM" resolves the issue on kernel
3.13.9-100.  Thanks!

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1397588421.5A7031.5414
Date: Tue, 15 Apr 2014 19:00:21 +0000
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
   title="NEW --- - [NVE7] fails to load with error -22"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77494#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE7] fails to load with error -22"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=77494">bug 77494</a>
              from <span class="vcard"><a class="email" href="mailto:mpredosin&#64;gmail.com" title="Mirko Predosin &lt;mpredosin&#64;gmail.com&gt;"> <span class="fn">Mirko Predosin</span></a>
</span></b>
        <pre>Booting with &quot;nouveau.config=NvBios=PROM&quot; resolves the issue on kernel
3.13.9-100.  Thanks!</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1397588421.5A7031.5414--

--===============0448547522==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0448547522==--
