From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 90626] HP ZBook 15 nouveau driver hangup for kernel
	>= 4.1
Date: Mon, 02 Nov 2015 08:54:00 +0000
Message-ID: <bug-90626-8800-yrO0TdWmZE@http.bugs.freedesktop.org/>
References: <bug-90626-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1026849249=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-90626-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1026849249==
Content-Type: multipart/alternative; boundary="1446454441.4bFDa74.2596"; charset="UTF-8"


--1446454441.4bFDa74.2596
Date: Mon, 2 Nov 2015 08:54:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=90626

--- Comment #26 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
FTR, the _ROM function from both dumps (same thing):

            Method (_ROM, 2, NotSerialized)  // _ROM: Read-Only Memory
            {
                Local0 += Arg0 = (VRMB (0x04) + Local0)
                Local1 = (VRMS () - 0x04)
                If ((Arg0 < Local1))
                {
                    OperationRegion (OROM, SystemMemory, Local0, 0x1000)
                    Field (OROM, AnyAcc, NoLock, Preserve)
                    {
                        R4KB,   32768
                    }

                    Return (R4KB) /* \_SB_.PCI0.PEGP.DGFX._ROM.R4KB */
                }
                Else
                {
                    Local0 = Buffer (0x01)
                        {
                             0x00                                            
/* . */
                        }
                    Return (Local0)
                }
            }

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1446454441.4bFDa74.2596
Date: Mon, 2 Nov 2015 08:54:01 +0000
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
   title="NEW - HP ZBook 15 nouveau driver hangup for kernel &gt;= 4.1"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90626#c26">Comment # 26</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - HP ZBook 15 nouveau driver hangup for kernel &gt;= 4.1"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=90626">bug 90626</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>FTR, the _ROM function from both dumps (same thing):

            Method (_ROM, 2, NotSerialized)  // _ROM: Read-Only Memory
            {
                Local0 += Arg0 = (VRMB (0x04) + Local0)
                Local1 = (VRMS () - 0x04)
                If ((Arg0 &lt; Local1))
                {
                    OperationRegion (OROM, SystemMemory, Local0, 0x1000)
                    Field (OROM, AnyAcc, NoLock, Preserve)
                    {
                        R4KB,   32768
                    }

                    Return (R4KB) /* \_SB_.PCI0.PEGP.DGFX._ROM.R4KB */
                }
                Else
                {
                    Local0 = Buffer (0x01)
                        {
                             0x00                                            
/* . */
                        }
                    Return (Local0)
                }
            }</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1446454441.4bFDa74.2596--

--===============1026849249==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1026849249==--
