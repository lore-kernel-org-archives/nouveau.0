From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 93778] [NVE7] Noveau GeForce GT 640M vbios error
Date: Tue, 19 Jan 2016 18:24:24 +0000
Message-ID: <bug-93778-8800-wViEG3X2CB@http.bugs.freedesktop.org/>
References: <bug-93778-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1229653293=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-93778-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1229653293==
Content-Type: multipart/alternative; boundary="14532278650.FbC4FdD6b.12063";
 charset="UTF-8"


--14532278650.FbC4FdD6b.12063
Date: Tue, 19 Jan 2016 18:24:24 +0000
MIME-Version: 1.0
Content-Type: text/plain

https://bugs.freedesktop.org/show_bug.cgi?id=93778

Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|Noveau GeForce GT 640M      |[NVE7] Noveau GeForce GT
                   |vbios error                 |640M vbios error

--- Comment #1 from Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> ---
I think the issue is a buggy _ROM method. Instead of Add (Arg0, Arg1, Local2)
it should be Add(Local0, Local1, Local2) :(

It clamps the read length to 0x1000, which is common. But then it goes ahead
and sets the length to the total length - offset if the offset + original
length (not the clamped length) is too big. No idea how negatives are handled
in ACPI either.

Our first request is offset = 0, length = 0x1000, so that should be good.
However our second request is offset = 0x1000 length = round_up(remainder,
0x1000). I think this will hit the issue outlined above. Instead of the length
being clamped to 0x1000, it will determine that we're overflowing and reset the
length to total - offset, which will be way bigger than 0x1000. Since it has
the vbios data in multiple 32K regions, this won't return the correct data.

Ben, thoughts on how to detect this?

    Scope (\_SB.PCI0.PEG0.PEGP)
    {
        OperationRegion (VBOR, SystemMemory, 0x9AF9C018, 0x00016004)
        Field (VBOR, DWordAcc, Lock, Preserve)
        {
            RVBS,   32, 
            VBS1,   262144, 
            VBS2,   262144, 
            VBS3,   196608, 
            VBS4,   0
        }
    }


        Method (_ROM, 2, NotSerialized)  // _ROM: Read-Only Memory
        {
            Store (Arg0, Local0)
            Store (Arg1, Local1)
            Name (VROM, Buffer (Local1)
            {
                 0x00                                             /* . */
            })
            If (LGreater (Local1, 0x1000))
            {
                Store (0x1000, Local1)
            }

            If (LGreater (Arg0, RVBS))
            {
                Return (VROM) /* \_SB_.PCI0.PEG0.PEGP._ROM.VROM */
            }

            Add (Arg0, Arg1, Local2)
            If (LGreater (Local2, RVBS))
            {
                Subtract (RVBS, Local0, Local1)
            }

            If (LLess (Local0, 0x8000))
            {
                Mid (VBS1, Local0, Local1, VROM) /*
\_SB_.PCI0.PEG0.PEGP._ROM.VROM */
            }
            Else
            {
                Subtract (Local0, 0x8000, Local0)
                If (LLess (Local0, 0x8000))
                {
                    Mid (VBS2, Local0, Local1, VROM) /*
\_SB_.PCI0.PEG0.PEGP._ROM.VROM */
                }
                Else
                {
                    Subtract (Local0, 0x8000, Local0)
                    If (LLess (Local0, 0x8000))
                    {
                        Mid (VBS3, Local0, Local1, VROM) /*
\_SB_.PCI0.PEG0.PEGP._ROM.VROM */
                    }
                    Else
                    {
                        Subtract (Local0, 0x8000, Local0)
                        If (LLess (Local0, 0x8000))
                        {
                            Mid (VBS4, Local0, Local1, VROM) /*
\_SB_.PCI0.PEG0.PEGP._ROM.VROM */
                        }
                    }
                }
            }

            Return (VROM) /* \_SB_.PCI0.PEG0.PEGP._ROM.VROM */
        }

-- 
You are receiving this mail because:
You are the assignee for the bug.
--14532278650.FbC4FdD6b.12063
Date: Tue, 19 Jan 2016 18:24:25 +0000
MIME-Version: 1.0
Content-Type: text/html

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body><span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span> changed
              <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE7] Noveau GeForce GT 640M vbios error"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93778">bug 93778</a>
          <br>
             <table border="1" cellspacing="0" cellpadding="8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style="text-align:right;">Summary</td>
           <td>Noveau GeForce GT 640M vbios error
           </td>
           <td>[NVE7] Noveau GeForce GT 640M vbios error
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE7] Noveau GeForce GT 640M vbios error"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93778#c1">Comment # 1</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVE7] Noveau GeForce GT 640M vbios error"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=93778">bug 93778</a>
              from <span class="vcard"><a class="email" href="mailto:imirkin&#64;alum.mit.edu" title="Ilia Mirkin &lt;imirkin&#64;alum.mit.edu&gt;"> <span class="fn">Ilia Mirkin</span></a>
</span></b>
        <pre>I think the issue is a buggy _ROM method. Instead of Add (Arg0, Arg1, Local2)
it should be Add(Local0, Local1, Local2) :(

It clamps the read length to 0x1000, which is common. But then it goes ahead
and sets the length to the total length - offset if the offset + original
length (not the clamped length) is too big. No idea how negatives are handled
in ACPI either.

Our first request is offset = 0, length = 0x1000, so that should be good.
However our second request is offset = 0x1000 length = round_up(remainder,
0x1000). I think this will hit the issue outlined above. Instead of the length
being clamped to 0x1000, it will determine that we're overflowing and reset the
length to total - offset, which will be way bigger than 0x1000. Since it has
the vbios data in multiple 32K regions, this won't return the correct data.

Ben, thoughts on how to detect this?

    Scope (\_SB.PCI0.PEG0.PEGP)
    {
        OperationRegion (VBOR, SystemMemory, 0x9AF9C018, 0x00016004)
        Field (VBOR, DWordAcc, Lock, Preserve)
        {
            RVBS,   32, 
            VBS1,   262144, 
            VBS2,   262144, 
            VBS3,   196608, 
            VBS4,   0
        }
    }


        Method (_ROM, 2, NotSerialized)  // _ROM: Read-Only Memory
        {
            Store (Arg0, Local0)
            Store (Arg1, Local1)
            Name (VROM, Buffer (Local1)
            {
                 0x00                                             /* . */
            })
            If (LGreater (Local1, 0x1000))
            {
                Store (0x1000, Local1)
            }

            If (LGreater (Arg0, RVBS))
            {
                Return (VROM) /* \_SB_.PCI0.PEG0.PEGP._ROM.VROM */
            }

            Add (Arg0, Arg1, Local2)
            If (LGreater (Local2, RVBS))
            {
                Subtract (RVBS, Local0, Local1)
            }

            If (LLess (Local0, 0x8000))
            {
                Mid (VBS1, Local0, Local1, VROM) /*
\_SB_.PCI0.PEG0.PEGP._ROM.VROM */
            }
            Else
            {
                Subtract (Local0, 0x8000, Local0)
                If (LLess (Local0, 0x8000))
                {
                    Mid (VBS2, Local0, Local1, VROM) /*
\_SB_.PCI0.PEG0.PEGP._ROM.VROM */
                }
                Else
                {
                    Subtract (Local0, 0x8000, Local0)
                    If (LLess (Local0, 0x8000))
                    {
                        Mid (VBS3, Local0, Local1, VROM) /*
\_SB_.PCI0.PEG0.PEGP._ROM.VROM */
                    }
                    Else
                    {
                        Subtract (Local0, 0x8000, Local0)
                        If (LLess (Local0, 0x8000))
                        {
                            Mid (VBS4, Local0, Local1, VROM) /*
\_SB_.PCI0.PEG0.PEGP._ROM.VROM */
                        }
                    }
                }
            }

            Return (VROM) /* \_SB_.PCI0.PEG0.PEGP._ROM.VROM */
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
--14532278650.FbC4FdD6b.12063--

--===============1229653293==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1229653293==--
