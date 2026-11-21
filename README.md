# DGT Assessoria · site

Site estático (HTML, CSS e JavaScript puro, sem build) da DGT Assessoria: recuperação e blindagem de contas em redes sociais.

## Como abrir
Abra `index.html` no navegador. Para ver com um servidor local (necessário em alguns navegadores para carregar as imagens):

```powershell
powershell -ExecutionPolicy Bypass -File serve.ps1
```

e acesse http://localhost:8123/.

## O que tem
- `index.html`: página principal (hero animado, central de operações com agentes, serviços, redes, prova social, calculadora, perguntas).
- `instagram.html`, `facebook.html`, `tiktok.html`, `whatsapp.html`, `youtube.html`, `twitter.html`, `snapchat.html`, `pinterest.html`: variações por rede (geradas a partir do `index.html`, trocando título e mensagem de WhatsApp).
- `img/prova/`: prints de clientes usados na prova social.

## Antes de publicar
- Trocar o número de WhatsApp: constante `WHATSAPP` no começo do `<script>` (DDI + DDD + número, só dígitos). O valor atual é um marcador.
- Confirmar com o cliente os números de contas recuperadas e os textos de segurança (LGPD, sigilo, análise gratuita).