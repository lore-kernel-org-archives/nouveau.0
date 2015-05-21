From: Pierre Moreau <pierre.morrow-GANU6spQydw@public.gmane.org>
Subject: Re: Handling GeForce GTX 850M GPU on Arch Linux
Date: Thu, 21 May 2015 17:03:40 +0200
Message-ID: <D470DE38-0266-4CD5-A9CB-25255F06443C@free.fr>
References: <a131e6c84ed9b648190c97b10fc4bd13.squirrel@mail2tor2zyjdctd.onion>
 <CAKb7UvjWU3xxpmM4k4J82t33WR-m8Yxse-6DrWu6kDbk8NHGmw@mail.gmail.com>
 <555A22F0.2080101@gmail.com>
 <c232ecade78b7ee1122da3e50df29a22.squirrel@mail2tor2zyjdctd.onion>
 <CACAvsv48CNeee7O9rgruqJS7=sq9Vjzc9o5PstmGu86xeAarsQ@mail.gmail.com>
 <a9127ca8692e18e6fad85aec51ae2882.squirrel@mail2tor2zyjdctd.onion>
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
Content-Type: multipart/mixed; boundary="===============0568123320=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <a9127ca8692e18e6fad85aec51ae2882.squirrel-ruvOiOuSH0fsJmqe0W8EJvmVnJLW1JIT@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: caocoa-ruvOiOuSH0dWk0Htik3J/w@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0568123320==
Content-Type: multipart/signed; boundary="Apple-Mail=_6CD17445-3053-4201-9EA1-0551B3E4AF76"; protocol="application/pkcs7-signature"; micalg=sha1


--Apple-Mail=_6CD17445-3053-4201-9EA1-0551B3E4AF76
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Your first reply did also sent it to the mailing list. :-)

[1] is indeed the correct site to report the bug, with Product=3Dxorg =
and Component=3DDriver/nouveau.

Pierre


> On 21 May 2015, at 16:48, caocoa-ruvOiOuSH0dWk0Htik3J/w@public.gmane.org wrote:
>=20
> OK, I'll do that when I'll have a bit more free time, but likely =
within
> the 10 next days. Shall I fill the report on this site[1] ?
>=20
> I've read this page[2], I'll try to comply to your needs :)
>=20
> Caocoa
>=20
> [1] https://bugs.freedesktop.org
> [2] https://wiki.freedesktop.org/nouveau/Bugs/
>=20
> P.S.: I've previously sent this message only to the last replier =
instead
> of the mailing list, here I fix it.
>=20
>> On 20 May 2015 at 17:11,  <caocoa-ruvOiOuSH0dWk0Htik3J/w@public.gmane.org> wrote:
>>> Ok thanks, I'll keep to it for now. Would you like me to (try to) =
fill a
>>> bug report report for that?
>>> By the way, if you come to work on that bug, I'll be glad to =
experiment
>>> your solution on my machine :)
>> A bug report would be great.
>>=20
>> Could you also attach a mmiotrace[1] of the NVIDIA binary driver, and
>> another log of nouveau failing with "nouveau.debug=3Dtrace
>> log_buf_len=3D1M" in your kernel boot options.
>>=20
>> Thanks,
>> Ben.
>>=20
>> [1] http://nouveau.freedesktop.org/wiki/MmioTrace/
>>=20
>>>=20
>>> Caocoa
>>>=20
>>>> On 18.05.2015 01:46, Ilia Mirkin wrote:
>>>>> Your errors are most likely due to:
>>>>>=20
>>>>> [    2.421428] nouveau  [     PFB][0000:01:00.0] RAM size: =
1975398418
>>>>> MiB
>>>>>=20
>>>>> I'm guessing you don't *actually* have 1.9PB of VRAM. At least one
>>>>> other person with a GM108 was seeing a similar issue. You're =
getting a
>>>>> bunch of other failed reads, looks like we're somehow not bringing =
the
>>>>> card up properly. The most immediate "fix" is to just disable =
nouveau
>>>>> entirely -- boot with nouveau.modeset=3D0.
>>>>>=20
>>>>> Cheers,
>>>>>=20
>>>>>  -ilia
>>>>>=20
>>>>=20
>>>>=20
>>>> As the IGPs "tend" to "steal" system memory:
>>>>=20
>>>> [   21.733864] nouveau  [     PFB][0000:01:00.0] RAM type: stolen
>>>> system
>>>> memory
>>>> [   21.733883] nouveau  [     PFB][0000:01:00.0] RAM size: 256 MiB
>>>> [   21.787222] nouveau  [     DRM] VRAM: 256 MiB
>>>>=20
>>>> can we reverse the process in this case, and "steal" a few GB of =
VRAM
>>>> for
>>>> a system memory?
>>>> I mean there are more than enough.
>>>>=20
>>>>=20
>>>>=20
>>>=20
>>>=20
>>> _______________________________________________
>>> Nouveau mailing list
>>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>>> http://lists.freedesktop.org/mailman/listinfo/nouveau
>>=20
>=20
>=20
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau


--Apple-Mail=_6CD17445-3053-4201-9EA1-0551B3E4AF76
Content-Disposition: attachment;
	filename=smime.p7s
Content-Type: application/pkcs7-signature;
	name=smime.p7s
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIMhDCCBjQw
ggQcoAMCAQICAR4wDQYJKoZIhvcNAQEFBQAwfTELMAkGA1UEBhMCSUwxFjAUBgNVBAoTDVN0YXJ0
Q29tIEx0ZC4xKzApBgNVBAsTIlNlY3VyZSBEaWdpdGFsIENlcnRpZmljYXRlIFNpZ25pbmcxKTAn
BgNVBAMTIFN0YXJ0Q29tIENlcnRpZmljYXRpb24gQXV0aG9yaXR5MB4XDTA3MTAyNDIxMDE1NVoX
DTE3MTAyNDIxMDE1NVowgYwxCzAJBgNVBAYTAklMMRYwFAYDVQQKEw1TdGFydENvbSBMdGQuMSsw
KQYDVQQLEyJTZWN1cmUgRGlnaXRhbCBDZXJ0aWZpY2F0ZSBTaWduaW5nMTgwNgYDVQQDEy9TdGFy
dENvbSBDbGFzcyAxIFByaW1hcnkgSW50ZXJtZWRpYXRlIENsaWVudCBDQTCCASIwDQYJKoZIhvcN
AQEBBQADggEPADCCAQoCggEBAMcJg8zOLdgasSmkLhOrlr6KMoOMpohBllVHrdRvEg/q6r8jR+EK
75xCGhR8ToREoqe7zM9/UnC6TS2y9UKTpT1v7RSMzR0t6ndl0TWBuUr/UXBhPk+Kmy7bI4yW4urC
+y7P3/1/X7U8ocb8VpH/Clt+4iq7nirMcNh6qJR+xjOhV+VHzQMALuGYn5KZmc1NbJQYclsGkDxD
z2UbFqE2+6vIZoL+jb9x4Pa5gNf1TwSDkOkikZB1xtB4ZqtXThaABSONdfmv/Z1pua3FYxnCFmdr
/+N2JLKutIxMYqQOJebr/f/h5t95m4JgrM3Y/w7YX9d7YAL9jvN4SydHsU6n65cCAwEAAaOCAa0w
ggGpMA8GA1UdEwEB/wQFMAMBAf8wDgYDVR0PAQH/BAQDAgEGMB0GA1UdDgQWBBRTcu2SnODaywFc
fH6WNU7y1LhRgjAfBgNVHSMEGDAWgBROC+8apEBbpRdphzDKNGhD0EGu8jBmBggrBgEFBQcBAQRa
MFgwJwYIKwYBBQUHMAGGG2h0dHA6Ly9vY3NwLnN0YXJ0c3NsLmNvbS9jYTAtBggrBgEFBQcwAoYh
aHR0cDovL3d3dy5zdGFydHNzbC5jb20vc2ZzY2EuY3J0MFsGA1UdHwRUMFIwJ6AloCOGIWh0dHA6
Ly93d3cuc3RhcnRzc2wuY29tL3Nmc2NhLmNybDAnoCWgI4YhaHR0cDovL2NybC5zdGFydHNzbC5j
b20vc2ZzY2EuY3JsMIGABgNVHSAEeTB3MHUGCysGAQQBgbU3AQIBMGYwLgYIKwYBBQUHAgEWImh0
dHA6Ly93d3cuc3RhcnRzc2wuY29tL3BvbGljeS5wZGYwNAYIKwYBBQUHAgEWKGh0dHA6Ly93d3cu
c3RhcnRzc2wuY29tL2ludGVybWVkaWF0ZS5wZGYwDQYJKoZIhvcNAQEFBQADggIBAAqDCH14qywG
XLhjjF6uHLkjd02hcdh9hrw+VUsv+q1eeQWB21jWj3kJ96AUlPCoEGZ/ynJNScWy6QMVQjbbMXlt
UfO4n4bGGdKo3awPWp61tjAFgraLJgDk+DsSvUD6EowjMTNx25GQgyYJ5RPIzKKR9tQW8gGK+2+R
HxkUCTbYFnL6kl8Ch507rUdPPipJ9CgJFws3kDS3gOS5WFMxcjO5DwKfKSETEPrHh7p5shuuNktv
sv6hxHTLhiMKX893gxdT3XLS9OKmCv87vkINQcNEcIIoFWbP9HORz9v3vQwR4e3ksLc2JZOAFK+s
sS5XMEoznzpihEP0PLc4dCBYjbvSD7kxgDwZ+Aj8Q9PkbvE9sIPP7ON0fz095HdThKjiVJe6vofq
+n6b1NBc8XdrQvBmunwxD5nvtTW4vtN6VY7mUCmxsCieuoBJ9OlqmsVWQvifIYf40dJPZkk9YgGT
zWLpXDSfLSplbY2LL9C9U0ptvjcDjefLTvqSFc7tw1sEhF0n/qpA2r0GpvkLRDmcSwVyPvmjFBGq
Up/pNy8ZuPGQmHwFi2/14+xeSUDG2bwnsYJQG2EdJCB6luQ57GEnTA/yKZSTKI8dDQa8Sd3zfXb1
9mOgSF0bBdXbuKhEpuP9wirslFe6fQ1t5j5R0xi72MZ8ikMu1RQZKCyDbMwazlHiMIIGSDCCBTCg
AwIBAgIDDEDcMA0GCSqGSIb3DQEBBQUAMIGMMQswCQYDVQQGEwJJTDEWMBQGA1UEChMNU3RhcnRD
b20gTHRkLjErMCkGA1UECxMiU2VjdXJlIERpZ2l0YWwgQ2VydGlmaWNhdGUgU2lnbmluZzE4MDYG
A1UEAxMvU3RhcnRDb20gQ2xhc3MgMSBQcmltYXJ5IEludGVybWVkaWF0ZSBDbGllbnQgQ0EwHhcN
MTQxMjE0MTg0NTA1WhcNMTUxMjE1MDkxMzUxWjBhMRkwFwYDVQQNExBURnJHNzJmak03OERTWVFR
MR4wHAYDVQQDDBVwaWVycmUubW9ycm93QGZyZWUuZnIxJDAiBgkqhkiG9w0BCQEWFXBpZXJyZS5t
b3Jyb3dAZnJlZS5mcjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALzC9baao7RHqaVb
Eb06OjZyRKsZNwQptzU2fOBkKQjC58C/tYIvA56z2hDcF+jz7xjzvP52R2GqzcFuuV17RSa4rn9M
yqLo9Xs09uQ5ktBnv97skTD9ifFB/i8wqHuUflrlE8ROn0DiibsKCZOwO2ylbzOFsRPFHzEDAUB9
Fovem8XFIbDc01mwKqKsDyhfIJIQ8kbIaJVu0wM0gP21UB+1Hk/bDrrJaw2mAT+DaEkMiuPAYkSr
97pTNDdsqhSB9u2d5wgaLllWXK36mWf0jQ1cc0oV44Ap8L65bvAo3WhZqqmfHvaxuKVDBEPZJdV1
gcCL4eU7zfcBAVHGsgDb2LUCAwEAAaOCAtswggLXMAkGA1UdEwQCMAAwCwYDVR0PBAQDAgSwMB0G
A1UdJQQWMBQGCCsGAQUFBwMCBggrBgEFBQcDBDAdBgNVHQ4EFgQUKdwrh69aDJuOcFtsqv3bYEtu
HaEwHwYDVR0jBBgwFoAUU3Ltkpzg2ssBXHx+ljVO8tS4UYIwIAYDVR0RBBkwF4EVcGllcnJlLm1v
cnJvd0BmcmVlLmZyMIIBTAYDVR0gBIIBQzCCAT8wggE7BgsrBgEEAYG1NwECAzCCASowLgYIKwYB
BQUHAgEWImh0dHA6Ly93d3cuc3RhcnRzc2wuY29tL3BvbGljeS5wZGYwgfcGCCsGAQUFBwICMIHq
MCcWIFN0YXJ0Q29tIENlcnRpZmljYXRpb24gQXV0aG9yaXR5MAMCAQEagb5UaGlzIGNlcnRpZmlj
YXRlIHdhcyBpc3N1ZWQgYWNjb3JkaW5nIHRvIHRoZSBDbGFzcyAxIFZhbGlkYXRpb24gcmVxdWly
ZW1lbnRzIG9mIHRoZSBTdGFydENvbSBDQSBwb2xpY3ksIHJlbGlhbmNlIG9ubHkgZm9yIHRoZSBp
bnRlbmRlZCBwdXJwb3NlIGluIGNvbXBsaWFuY2Ugb2YgdGhlIHJlbHlpbmcgcGFydHkgb2JsaWdh
dGlvbnMuMDYGA1UdHwQvMC0wK6ApoCeGJWh0dHA6Ly9jcmwuc3RhcnRzc2wuY29tL2NydHUxLWNy
bC5jcmwwgY4GCCsGAQUFBwEBBIGBMH8wOQYIKwYBBQUHMAGGLWh0dHA6Ly9vY3NwLnN0YXJ0c3Ns
LmNvbS9zdWIvY2xhc3MxL2NsaWVudC9jYTBCBggrBgEFBQcwAoY2aHR0cDovL2FpYS5zdGFydHNz
bC5jb20vY2VydHMvc3ViLmNsYXNzMS5jbGllbnQuY2EuY3J0MCMGA1UdEgQcMBqGGGh0dHA6Ly93
d3cuc3RhcnRzc2wuY29tLzANBgkqhkiG9w0BAQUFAAOCAQEAUQEMhjmm4yZyLf8jRn7mJpu9lAxR
zn1Ec/Q3iqOg0lhKxNglTPL1H6WRuio+xOOof8WJs7b7InpDn3+0XaK6a7WwDssNwF4YtadcRR9i
/jVGUthSeuVykj2wqElLiIfit4j5TomLfdN5B+Dv6kL5CG+IyaxSS6Y8qbZkZH1N8aVWUGyFT4EL
uvPW/UI2iwhEjyutiRpNEWCYKH6f1nnIFJQGRd9v83kk7gzGiD2QtjzGVb2YxYDLdyE4Xj1N32ZP
mBZMgK/68rMkI6VpxqoyblODP5F6YY3+T7YgjpLfUu7gGvEuacP/ZZ0kJyS7deBnriRYuVfSi5Cp
Tg1RPS2o2TGCA28wggNrAgEBMIGUMIGMMQswCQYDVQQGEwJJTDEWMBQGA1UEChMNU3RhcnRDb20g
THRkLjErMCkGA1UECxMiU2VjdXJlIERpZ2l0YWwgQ2VydGlmaWNhdGUgU2lnbmluZzE4MDYGA1UE
AxMvU3RhcnRDb20gQ2xhc3MgMSBQcmltYXJ5IEludGVybWVkaWF0ZSBDbGllbnQgQ0ECAwxA3DAJ
BgUrDgMCGgUAoIIBrzAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0x
NTA1MjExNTAzNDFaMCMGCSqGSIb3DQEJBDEWBBTXaE0I7Ng5uCl7+HwPHrZrlvk+ETCBpQYJKwYB
BAGCNxAEMYGXMIGUMIGMMQswCQYDVQQGEwJJTDEWMBQGA1UEChMNU3RhcnRDb20gTHRkLjErMCkG
A1UECxMiU2VjdXJlIERpZ2l0YWwgQ2VydGlmaWNhdGUgU2lnbmluZzE4MDYGA1UEAxMvU3RhcnRD
b20gQ2xhc3MgMSBQcmltYXJ5IEludGVybWVkaWF0ZSBDbGllbnQgQ0ECAwxA3DCBpwYLKoZIhvcN
AQkQAgsxgZeggZQwgYwxCzAJBgNVBAYTAklMMRYwFAYDVQQKEw1TdGFydENvbSBMdGQuMSswKQYD
VQQLEyJTZWN1cmUgRGlnaXRhbCBDZXJ0aWZpY2F0ZSBTaWduaW5nMTgwNgYDVQQDEy9TdGFydENv
bSBDbGFzcyAxIFByaW1hcnkgSW50ZXJtZWRpYXRlIENsaWVudCBDQQIDDEDcMA0GCSqGSIb3DQEB
AQUABIIBALU9HAD+z7Mos/JifqfoADSUijbGXc4QqXWuKhP4evfPni+KmcuAxBBQWL5tuXr4dYiH
1uPdX/FFjrDP+75nZku8q0QiwSOXwC1NJXEg21sDYZ+DoIBtfWbB03ISF1U6BWfQvqKwBr5L8SkF
LU5DdLVsZPZ0MwyHk1tt2n4H4DDF00BX0ap3LYavyhF1rIVWxp4F7sTLkumlj09t2obpe9fbjry8
/LwHgO7IZMx6pjw1i6P5bDItdHEo4vjaqJ7ktQoWGOwXhExwXC18Nt1UXK23Y0qGaqV3nNvGnITi
ggD+Tpf/mra8/akMQ2X/OQtbsh0ZsngHCPPNx9jmDwBXPgcAAAAAAAA=
--Apple-Mail=_6CD17445-3053-4201-9EA1-0551B3E4AF76--

--===============0568123320==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0568123320==--
