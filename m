From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87361] [NV4C] GPU lock-up after booting to desktop
 in Fedora 20 & 21 (Nvidia Geforce 6100 IGP)
Date: Wed, 17 Dec 2014 06:28:28 +0000
Message-ID: <bug-87361-8800-Nn0Fvm1bZ1@http.bugs.freedesktop.org/>
References: <bug-87361-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0139007427=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-87361-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0139007427==
Content-Type: multipart/alternative; boundary="1418797708.F2F3eBe50.26303"; charset="UTF-8"


--1418797708.F2F3eBe50.26303
Date: Wed, 17 Dec 2014 06:28:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87361

--- Comment #4 from Jan Jasper de Kroon <jajadekroon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
Hello Ilia,

I will also test you're previous suggestion with nv40.c changing the 0x4c case
device->oclass[NVDEV_SUBDEV_MC     ] =  nv4c_mc_oclass to:
device->oclass[NVDEV_SUBDEV_MC     ] =  nv44_mc_oclass
Then at least you know what difference it would have made.
And also if you'd like I can try you're suggested patch to disable the msi
alltoghether as well.
Let me know if I can be of any help.

Greetings Jan Jasper de Kroon

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1418797708.F2F3eBe50.26303
Date: Wed, 17 Dec 2014 06:28:28 +0000
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
   title="NEW - [NV4C] GPU lock-up after booting to desktop in Fedora 20 &amp; 21 (Nvidia Geforce 6100 IGP)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87361#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV4C] GPU lock-up after booting to desktop in Fedora 20 &amp; 21 (Nvidia Geforce 6100 IGP)"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87361">bug 87361</a>
              from <span class="vcard"><a class="email" href="mailto:jajadekroon&#64;gmail.com" title="Jan Jasper de Kroon &lt;jajadekroon&#64;gmail.com&gt;"> <span class="fn">Jan Jasper de Kroon</span></a>
</span></b>
        <pre>Hello Ilia,

I will also test you're previous suggestion with nv40.c changing the 0x4c case
device-&gt;oclass[NVDEV_SUBDEV_MC     ] =  nv4c_mc_oclass to:
device-&gt;oclass[NVDEV_SUBDEV_MC     ] =  nv44_mc_oclass
Then at least you know what difference it would have made.
And also if you'd like I can try you're suggested patch to disable the msi
alltoghether as well.
Let me know if I can be of any help.

Greetings Jan Jasper de Kroon</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1418797708.F2F3eBe50.26303--

--===============0139007427==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0139007427==--
