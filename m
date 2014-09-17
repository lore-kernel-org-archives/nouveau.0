From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 83992] [NVE0][NVF1] regression,
	linux 3.17 causes gpu lockups
Date: Wed, 17 Sep 2014 15:47:42 +0000
Message-ID: <bug-83992-8800-7H3BapyBi0@http.bugs.freedesktop.org/>
References: <bug-83992-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0293338410=="
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


--===============0293338410==
Content-Type: multipart/alternative; boundary="1410968861.f5340aef1.27181"; charset="us-ascii"


--1410968861.f5340aef1.27181
Date: Wed, 17 Sep 2014 15:47:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=83992

--- Comment #3 from Tom Englund <tomenglund26-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
checking out a2d58c33a doesnt make X nor cs:go lockup however it artifacts
badly, and spams dmesg with this
https://gist.github.com/anonymous/f53c93768a9ba1ca0ee0 .

tried setting drivers/gpu/drm/nouveau/core/engine/graph/ctxgk110b.c
bundle_token_limit to 0x7c0 instead of 0x600 but no dice.

screenshot of it artifacting http://i.imgur.com/HLb8I6t.png and the artifacts
isnt contained to cs:go they go out on X aswell as you can see on dropbox
systray icon and garbles some text everywhere.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1410968861.f5340aef1.27181
Date: Wed, 17 Sep 2014 15:47:41 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=83992#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [NVE0][NVF1] regression, linux 3.17 causes gpu lockups"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=83992">bug 83992</a>
              from <span class="vcard"><a class="email" href="mailto:tomenglund26&#64;gmail.com" title="Tom Englund &lt;tomenglund26&#64;gmail.com&gt;"> <span class="fn">Tom Englund</span></a>
</span></b>
        <pre>checking out a2d58c33a doesnt make X nor cs:go lockup however it artifacts
badly, and spams dmesg with this
<a href="https://gist.github.com/anonymous/f53c93768a9ba1ca0ee0">https://gist.github.com/anonymous/f53c93768a9ba1ca0ee0</a> .

tried setting drivers/gpu/drm/nouveau/core/engine/graph/ctxgk110b.c
bundle_token_limit to 0x7c0 instead of 0x600 but no dice.

screenshot of it artifacting <a href="http://i.imgur.com/HLb8I6t.png">http://i.imgur.com/HLb8I6t.png</a> and the artifacts
isnt contained to cs:go they go out on X aswell as you can see on dropbox
systray icon and garbles some text everywhere.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1410968861.f5340aef1.27181--

--===============0293338410==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0293338410==--
