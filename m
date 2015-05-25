From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90567] Display freeze when starting League of
	Legends (Wine)
Date: Mon, 25 May 2015 09:18:26 +0000
Message-ID: <bug-90567-8800-77q2HTTWu4@http.bugs.freedesktop.org/>
References: <bug-90567-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2029308998=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90567-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============2029308998==
Content-Type: multipart/alternative; boundary="1432545506.2A4D2.12518"; charset="UTF-8"


--1432545506.2A4D2.12518
Date: Mon, 25 May 2015 09:18:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90567

--- Comment #6 from Samuel Pitoiset <samuel.pitoiset-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Created attachment 116021
  --> https://bugs.freedesktop.org/attachment.cgi?id=116021&action=edit
0001-nvc0-prevent-using-unvalidated-vertex-programs.patch

Hello Detlev,

Did you test with mesa git?
In any cases, could you please try this attached patch ?

I'm absolutely not sure it will fix your issue but let's try. :-)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1432545506.2A4D2.12518
Date: Mon, 25 May 2015 09:18:26 +0000
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
   title="NEW - Display freeze when starting League of Legends (Wine)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90567#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - Display freeze when starting League of Legends (Wine)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90567">bug 90567</a>
              from <span class="vcard"><a class="email" href="mailto:samuel.pitoiset&#64;gmail.com" title="Samuel Pitoiset &lt;samuel.pitoiset&#64;gmail.com&gt;"> <span class="fn">Samuel Pitoiset</span></a>
</span></b>
        <pre>Created <span class=""><a href="attachment.cgi?id=116021" name="attach_116021" title="0001-nvc0-prevent-using-unvalidated-vertex-programs.patch">attachment 116021</a> <a href="attachment.cgi?id=116021&amp;action=edit" title="0001-nvc0-prevent-using-unvalidated-vertex-programs.patch">[details]</a></span> <a href='page.cgi?id=splinter.html&amp;bug=90567&amp;attachment=116021'>[review]</a>
0001-nvc0-prevent-using-unvalidated-vertex-programs.patch

Hello Detlev,

Did you test with mesa git?
In any cases, could you please try this attached patch ?

I'm absolutely not sure it will fix your issue but let's try. :-)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1432545506.2A4D2.12518--

--===============2029308998==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============2029308998==--
