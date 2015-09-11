From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 81690] nouveau GPU locks up under memory pressure
Date: Fri, 11 Sep 2015 09:03:43 +0000
Message-ID: <bug-81690-8800-KNp3IYk1Mg@http.bugs.freedesktop.org/>
References: <bug-81690-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0507713046=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-81690-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0507713046==
Content-Type: multipart/alternative; boundary="1441962223.8DA764D3.18299"; charset="UTF-8"


--1441962223.8DA764D3.18299
Date: Fri, 11 Sep 2015 09:03:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=81690

--- Comment #4 from Michal Suchanek <hramrach-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Maybe this is somewhat relevant. The PC has supposedly working IOMMU which
might be reason for the page faults. I am not sure how the memory mapping for
the GPU works.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1441962223.8DA764D3.18299
Date: Fri, 11 Sep 2015 09:03:43 +0000
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
   title="NEW - nouveau GPU locks up under memory pressure"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=81690#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau GPU locks up under memory pressure"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=81690">bug 81690</a>
              from <span class="vcard"><a class="email" href="mailto:hramrach&#64;gmail.com" title="Michal Suchanek &lt;hramrach&#64;gmail.com&gt;"> <span class="fn">Michal Suchanek</span></a>
</span></b>
        <pre>Maybe this is somewhat relevant. The PC has supposedly working IOMMU which
might be reason for the page faults. I am not sure how the memory mapping for
the GPU works.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1441962223.8DA764D3.18299--

--===============0507713046==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0507713046==--
